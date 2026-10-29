cask "lithic" do
  version "10.29.26-1717"
  sha256 "356ec3f3f9fc1a698ed7d1f0ae1ad1d76c48a936501c8cdc66bfc85eee4d3a0f"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.29-1717/Lithic_#{version}.dmg"
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
