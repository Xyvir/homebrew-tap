cask "lithic" do
  version "10.10.26-1817"
  sha256 "60d6cb0acb4a45b85a8536e6d8911619ce5a00c6df94005385789cee10f80d7c"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.10-1817/Lithic_#{version}.dmg"
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
