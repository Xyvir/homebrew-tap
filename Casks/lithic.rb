cask "lithic" do
  version "10.23.26-1651"
  sha256 "f5544061ec7ae614799e6dce25c7f58d628620956479fee5f3af81b0ac9bccad"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.23-1651/Lithic_#{version}.dmg"
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
