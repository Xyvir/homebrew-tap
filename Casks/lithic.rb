cask "lithic" do
  version "10.09.26-1530"
  sha256 "3370bfda669794d45ee5987cbfdc3f487e8e3ec1a0ae26591b339883317a7538"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.09-1530/Lithic_#{version}.dmg"
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
