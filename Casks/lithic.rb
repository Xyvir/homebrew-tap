cask "lithic" do
  version "10.08.26-0945"
  sha256 "049912ae68ef92ba91b914d25b50f21dbeb5f64d65990aa17811a1096e4238b7"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.08-0945/Lithic_#{version}.dmg"
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
