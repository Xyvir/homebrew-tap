cask "lithic" do
  version "10.09.26-0654"
  sha256 "39474eb57a1102d49918df81de648b9ad6925ea629f7b31877d86926f53ba887"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.09-0654/Lithic_#{version}.dmg"
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
