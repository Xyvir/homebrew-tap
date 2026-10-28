cask "lithic" do
  version "10.27.26-2129"
  sha256 "ce0a54f195939f55610bb8335eae8e32a804b8fb30727649912c6e7390fa4e79"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.27-2129/Lithic_#{version}.dmg"
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
