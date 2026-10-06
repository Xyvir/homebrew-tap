cask "lithic" do
  version "10.05.26-2055"
  sha256 "dd7e0080eed0d86c4e7d9893be803f31a16f4f099b39128e7ed81613949f4568"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.05-2055/Lithic_#{version}.dmg"
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
