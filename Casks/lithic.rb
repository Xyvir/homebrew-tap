cask "lithic" do
  version "10.05.26-1534"
  sha256 "953a91924c668f2bff4708c5a28d604cf9471bfdd9ddcf1f37a873c4f5322d61"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.05-1534/Lithic_#{version}.dmg"
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
