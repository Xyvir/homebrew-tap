cask "lithic" do
  version "10.09.26-0002"
  sha256 "d325982da57c35338c468b6872f971acf5ad5dd77668f5a9e17511ac0d8d2dce"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.09-0002/Lithic_#{version}.dmg"
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
