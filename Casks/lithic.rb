cask "lithic" do
  version "10.12.26-2328"
  sha256 "800bca6f3626b2a465dbbbdaf75e3e24a3b28fba2f7e9bafb178f84507de65f0"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.12-2328/Lithic_#{version}.dmg"
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
