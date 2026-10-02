# The Lithic tap

A [Homebrew](https://brew.sh) tap for [Lithic](https://github.com/Xyvir/Lithic-UK), a
portable outliner knowledgebase built on TiddlyWiki. One cask, one app.

```sh
brew install --cask xyvir/tap/lithic
```

`brew` is the updater from then on: `brew upgrade --cask lithic` takes the next release.
Nothing else on the machine is touched — the cask puts `Lithic.app` in `/Applications` — and
the app keeps its state (saved logins, recent wikis, the folder a GitHub backup is pointed
at) in `~/Library/Application Support/Lithic`, so an upgrade replaces the app and nothing
else.

## Why this is a tap and not a cask in homebrew-cask

Because the Lithic builds are not signed and not notarized. An Apple Developer ID, and the
notarization it makes possible, are a paid annual membership; homebrew-cask requires its
casks to be signed and notarized. What is *not* lost by that is the install itself: Homebrew
downloads with `curl`, so the app arrives without the `com.apple.quarantine` attribute that a
browser adds to a download, and macOS opens it with no Gatekeeper dialog at all. That is the
advantage of installing this way rather than from the downloads page, where the disk image
needs one trip through **System Settings → Privacy & Security → Open Anyway**.

## How `Casks/lithic.rb` stays current

It maintains itself.
[`.github/workflows/update-cask.yml`](.github/workflows/update-cask.yml) runs hourly, asks
the public GitHub API for the newest Lithic release that carries a disk image, downloads
that image to read its checksum, and commits the cask when it has changed. There is no
secret in either repository and nothing to do by hand:

* the release job in `Xyvir/Lithic-UK` cannot push here — the token a workflow is given is
  scoped to its own repository — so this repository pulls rather than being pushed to;
* when no newer release exists, a run says so and changes nothing.

To refresh it on demand — after a release you would rather not wait for, or if GitHub has
switched the schedule off because the repository went quiet for 60 days (it emails when it
does; pressing **Run workflow** turns it back on):

```sh
gh workflow run update-cask.yml   # run in Xyvir/homebrew-tap
```

The script is short enough to read and run anywhere:

```sh
GH_TOKEN=... bash scripts/update-cask.sh   # writes Casks/lithic.rb, prints the version
```

## Uninstalling

```sh
brew uninstall --cask lithic          # removes the app
brew uninstall --cask --zap lithic    # ... and the state in ~/Library/Application Support/Lithic
```

The `--zap` half deletes the saved logins and the recent-wikis list with the app, which is
what it says it does. The `.lith` files themselves are wherever their owner saved them and
are never touched by either command.
