cask "lithic" do
  version "10.11.26-1935"
  sha256 "56825d97b067b1fef9af7000c33b2aa710ebb2c4029daf955616fb7bc9562863"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.11-1935/Lithic_#{version}.dmg"
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
