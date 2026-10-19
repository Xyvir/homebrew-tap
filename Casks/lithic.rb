cask "lithic" do
  version "10.19.26-1947"
  sha256 "63c3734317a78f2fe1a181820356d4f562ac612aca6c53dbe9521fda1458d942"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.19-1947/Lithic_#{version}.dmg"
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
