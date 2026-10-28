cask "lithic" do
  version "10.28.26-2002"
  sha256 "b2009497de273002f8179f7872df910f9d5542e0450607f8f2ee4556cc3fa29b"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.28-2002/Lithic_#{version}.dmg"
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
