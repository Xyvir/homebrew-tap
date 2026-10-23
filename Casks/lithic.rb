cask "lithic" do
  version "10.23.26-0000"
  sha256 "0b07c78d2697bff540e27d68b2975a5522f9a02f322bdbf9e5551db3acbc2e90"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.23-0000/Lithic_#{version}.dmg"
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
