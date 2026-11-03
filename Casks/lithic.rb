cask "lithic" do
  version "11.03.26-0025"
  sha256 "83adab9f895cb659cf70b870d9532718410e2a2949985ae5a1119d0d9c65e0c5"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.11.03-0025/Lithic_#{version}.dmg"
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
