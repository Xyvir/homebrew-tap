cask "lithic" do
  version "10.29.26-1227"
  sha256 "cc1b3e46bdc9fd681d21e042d3bb5976a70349f2e021712a931f1d6c71ff055c"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.29-1227/Lithic_#{version}.dmg"
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
