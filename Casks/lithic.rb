cask "lithic" do
  version "11.02.26-2331"
  sha256 "5e2924f22a128e5663f87f9d43cde0d009841366e38883f68bbb625b60540aad"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.11.02-2331/Lithic_#{version}.dmg"
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
