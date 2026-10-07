cask "lithic" do
  version "10.07.26-1945"
  sha256 "3f1bac6afbb9501e7f1719e58524f4184c292d91b22638c48de9467d2acf3671"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.07-1945/Lithic_#{version}.dmg"
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
