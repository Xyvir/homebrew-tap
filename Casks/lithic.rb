cask "lithic" do
  version "11.03.26-1600"
  sha256 "ed2398905c60ab880722295a5134b60bfda7b520817c3ff37a21d4800a8c384b"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.11.03-1600/Lithic_#{version}.dmg"
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
