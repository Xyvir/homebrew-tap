#!/usr/bin/env bash
# Regenerate Casks/lithic.rb from the newest Lithic release that carries a disk image.
#
# Why this repository pulls instead of the release job pushing: the token a GitHub Actions
# workflow is given can only write to the repository it runs in, and the alternative — a
# personal access token kept as a secret in the other repository — is a credential to mint,
# store and rotate. Everything needed here is public (the releases API and the image
# itself), and the only write is this repository's own.
#
# Run by `.github/workflows/update-cask.yml` on a schedule and on demand. Also runnable on
# any machine that has `gh` and `curl`:
#
#   GH_TOKEN=... bash scripts/update-cask.sh
#
# Prints what it did, and exits 0 when there is nothing to do, so a scheduled run on a
# repository with nothing new in it is a quiet success rather than a failure.
set -euo pipefail

REPO="${LITHIC_REPO:-Xyvir/Lithic-UK}"
CASK="${CASK_PATH:-Casks/lithic.rb}"

# The runner's own token, which is enough to read a public repository's releases. `gh` is on
# GitHub's images; a local run supplies its own.
if [ -z "${GH_TOKEN:-}" ] && [ -n "${GITHUB_TOKEN:-}" ]; then
  GH_TOKEN="$GITHUB_TOKEN"
fi
export GH_TOKEN

# The newest release carrying the disk image, and not necessarily the newest release: the
# release train has Windows and Linux jobs that can publish without this one, and a release
# from before the macOS job existed has no image at all. `releases` is newest first, and the
# first release with an asset named like the image wins.
#
# The program is single-quoted so nothing between here and jq rewrites it: the first draft
# interpolated a shell variable into a double-quoted program, the shell ate one of its two
# backslashes, and the escape jq was left with failed at run time rather than at write time.
# The dot is spelled `[.]` for the same reason — one fewer escape to be wrong about — and
# the expression is duplicated once, which is cheaper than the alternative.
newest=$(gh api "repos/$REPO/releases?per_page=40" --jq '
  first(.[]
    | select(any(.assets[]?; .name | test("^Lithic_[^/]*[.]dmg$")))
    | "\(.tag_name)\t\(first(.assets[] | select(.name | test("^Lithic_[^/]*[.]dmg$")) | .browser_download_url))")')

# `first(...)` yields nothing at all when no release matches, so an empty answer is the one
# case to test for: no image published yet, or none in the last forty releases.
if [ -z "$newest" ]; then
  echo "No Lithic release carries a disk image yet; nothing to do."
  exit 0
fi

IFS=$'\t' read -r tag url <<< "$newest"
asset="${url##*/}"
# The cask's `version` is the stamp the asset name carries (`Lithic_10.02.26-1857.dmg`),
# which is the name a person sees on the download, while the release tag it lives under is a
# separate string (`build-2026.10.02-1857`) that appears in the URL. Read from the asset
# name rather than re-derived from the tag, so a release tagged in a shape this script has
# never seen still produces a cask that points at a file that exists.
stamp="${asset#Lithic_}"
stamp="${stamp%.dmg}"

# Already current? The tag is the identity rather than the asset name — the asset name has
# to be written as `Lithic_#{version}.dmg` for Homebrew's own convention, so it is not in
# the file literally — and the tag is the one thing that changes per release. Two releases
# cut inside one minute share a stamp and differ here, which is the case this keeps apart.
if [ -f "$CASK" ] && grep -qF "releases/download/$tag/" "$CASK"; then
  echo "$CASK already points at $tag."
  exit 0
fi

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
echo "Downloading $asset from $tag to read its checksum ..."
curl -fsSL --retry 3 --retry-delay 2 -o "$work/$asset" "$url"
if command -v sha256sum >/dev/null 2>&1; then
  sha=$(sha256sum "$work/$asset" | awk '{print $1}')
else
  sha=$(shasum -a 256 "$work/$asset" | awk '{print $1}')
fi
if ! printf '%s' "$sha" | grep -Eq '^[0-9a-f]{64}$'; then
  echo "The download's checksum did not read as a checksum; refusing to write a cask." >&2
  exit 1
fi

mkdir -p "$(dirname "$CASK")"
# Written whole from a fixed template, so the file is right by construction rather than by
# editing: this script has exactly one shape to produce. `#{version}` appears in the URL
# because that is Homebrew's own convention and because the asset name really is built from
# the version; the tag stays literal because it is not a version and never was.
#
# The heredoc is unquoted so the four values above expand, which is also its one hazard: a
# backtick anywhere in the template runs as a command (a comment mentioning one did, once),
# so the template stays free of backticks and of dollar signs that are not meant.
cat > "$CASK" <<CASK
cask "lithic" do
  version "$stamp"
  sha256 "$sha"

  url "https://github.com/$REPO/releases/download/$tag/Lithic_#{version}.dmg"
  name "Lithic"
  desc "Outliner knowledgebase built on TiddlyWiki"
  homepage "https://lithic.uk"

  app "Lithic.app"

  # An upgrade replaces the bundle, so ask the running app to quit first rather than
  # replacing something that is still open. The identifier is the bundle's own.
  uninstall quit: "com.lithic.app"

  # Where an installed copy keeps its own state: the vault of saved logins and the recents
  # sidecar beside it. The zap stanza is what removes it; a plain uninstall leaves it alone.
  zap trash: "~/Library/Application Support/Lithic"
end
CASK

echo "Wrote $CASK: version $stamp, sha256 $sha"
