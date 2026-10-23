cask "lithic" do
  version "10.23.26-2128"
  sha256 "87bb801e7893b52f4d3d33a124c79210aa6806179408053b926cce7ed7f86aa2"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.23-2128/Lithic_#{version}.dmg"
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
