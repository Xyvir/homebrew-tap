cask "lithic" do
  version "10.30.26-1732"
  sha256 "1500ff8d13231729d73e8c795e77393374d02b5110d1e6aba9ca57d0a7fd5bb5"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.30-1732/Lithic_#{version}.dmg"
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
