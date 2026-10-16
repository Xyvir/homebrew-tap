cask "lithic" do
  version "10.16.26-1910"
  sha256 "73d133670e8e17d4d63b4d5fbe04697bb786cda78debce82bbc74d48ce6af0cd"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.16-1910/Lithic_#{version}.dmg"
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
