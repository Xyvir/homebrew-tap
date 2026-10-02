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
# Prints what it did and exits 0 when there is nothing to do, so a scheduled run on a
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
# release train has a Windows and two Linux jobs that can publish without this one, and a
# release from before the macOS job existed has no image at all. One API call, reduced in
# jq, so nothing here parses JSON by hand. `releases` is newest first.
newest=$(gh api "repos/$REPO/releases?per_page=40" --jq '
  [ .[]
    | { tag: .tag_name,
        dmg: ([ .assets[] | select(.name | test("^Lithic_.*\\.dmg$")) | .browser_download_url ] | first) }
    | select(.dmg != null) ][0]
  | "\(.tag)\t\(.dmg)"')

if [ -z "$newest" ] || [ "$newest" = "null" ]; then
  echo "No Lithic release carries a disk image yet; nothing to do."
  exit 0
fi

IFS=$'\t' read -r tag url <<< "$newest"
asset="${url##*/}"
# The cask's `version` is the stamp the asset name carries (`Lithic_10.02.26-1857.dmg`),
# which is the name a person sees on the download, while the release tag it lives under is a
# separate string (`build-2026.10.02-1857`) that appears in the URL. Read from the asset name rather
# than re-derived from the tag, so a release tagged in a shape this script has never seen
# still produces a cask that points at a file that exists.
stamp="${asset#Lithic_}"
stamp="${stamp%.dmg}"

# Already current? The tag and the asset together are the identity, because two releases cut
# inside one minute would share a stamp, and re-downloading a 20 MB image to rewrite an
# identical cask is a waste.
if [ -f "$CASK" ] && grep -qF "releases/download/$tag/$asset" "$CASK"; then
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
cat > "$CASK" <<CASK
cask "lithic" do
  version "$stamp"
  sha256 "$sha"

  url "https://github.com/$REPO/releases/download/$tag/Lithic_#{version}.dmg"
  name "Lithic"
  desc "Outliner knowledgebase built on TiddlyWiki"
  homepage "https://lithic.uk"

  app "Lithic.app"

  # The app's own state, where an installed Mac copy keeps it: the vault of saved logins and
  # the recents sidecar beside it. `--zap` removes it; a plain uninstall leaves it alone.
  zap trash: "~/Library/Application Support/Lithic"
end
CASK

echo "Wrote $CASK: version $stamp, sha256 $sha"
