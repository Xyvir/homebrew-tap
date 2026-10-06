cask "lithic" do
  version "10.06.26-1454"
  sha256 "2105be4d522c92946da842104936f272b7e4d87e379f97be7478c6ddf732d484"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.06-1454/Lithic_#{version}.dmg"
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
