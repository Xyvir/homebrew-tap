cask "lithic" do
  version "11.05.26-1642"
  sha256 "05521c0534b3b7cf7c00b7fdd8e68b527d69d71d66222aba59114ad0b7e59270"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.11.05-1642/Lithic_#{version}.dmg"
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
