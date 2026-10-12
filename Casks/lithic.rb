cask "lithic" do
  version "10.12.26-1921"
  sha256 "acb1b52f35934597c2bcc2883ab731086c3cb53d24de31d1b43a67880a4b3820"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.12-1921/Lithic_#{version}.dmg"
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
