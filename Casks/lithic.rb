cask "lithic" do
  version "10.30.26-2001"
  sha256 "fd07d530c7c57ad2777840473f253414fe463a6dadb48ee15b78cb9d46be25f8"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.30-2001/Lithic_#{version}.dmg"
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
