cask "lithic" do
  version "10.16.26-0307"
  sha256 "79bacbeca3d2209da3c06e0d533d375199f7acc8f68b95c572e2d00c98ba3025"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.16-0307/Lithic_#{version}.dmg"
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
