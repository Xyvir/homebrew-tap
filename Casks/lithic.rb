cask "lithic" do
  version "10.16.26-2055"
  sha256 "0e22b4faf4d6933092a917b4517de37e9c34524354d97bd91b20ca13b3714b20"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.16-2055/Lithic_#{version}.dmg"
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
