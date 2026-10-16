cask "lithic" do
  version "10.16.26-1543"
  sha256 "532e7208b59ef6c39e3c828254770daad05cea03b689a3b7be023b8df2173379"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.16-1543/Lithic_#{version}.dmg"
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
