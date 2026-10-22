cask "lithic" do
  version "10.21.26-2209"
  sha256 "726202a300f746101417c0163a57245c48c31576078ec7d831515d6d0ab5a264"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.21-2209/Lithic_#{version}.dmg"
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
