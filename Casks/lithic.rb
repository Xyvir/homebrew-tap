cask "lithic" do
  version "10.29.26-2236"
  sha256 "2035a744299714722a843849c2b54f5621c3375d44451716cd4611a14181951f"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.29-2236/Lithic_#{version}.dmg"
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
