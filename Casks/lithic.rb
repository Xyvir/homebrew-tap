cask "lithic" do
  version "10.09.26-1707"
  sha256 "84e3407b40ffb407d5701ca58e752c936b52ce5647de12e05567ab48bc153ed5"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.09-1707/Lithic_#{version}.dmg"
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
