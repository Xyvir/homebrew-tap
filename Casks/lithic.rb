cask "lithic" do
  version "10.28.26-2056"
  sha256 "269afa565b484fcc7bdea63ba7051aaa32fc56b429c1c385d87b45525bbeb347"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.28-2056/Lithic_#{version}.dmg"
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
