cask "lithic" do
  version "10.22.26-1548"
  sha256 "aa2ac676d2d12bae28f7f8728565fae3f983ab4a710698e7dc031182665abb1d"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.22-1548/Lithic_#{version}.dmg"
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
