cask "lithic" do
  version "10.23.26-2241"
  sha256 "481cdba8ada44be7d8fc99f10117d880ebe60e9dedd3d72522793d36b729c3e3"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.23-2241/Lithic_#{version}.dmg"
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
