cask "lithic" do
  version "10.24.26-0312"
  sha256 "d0a1e51a2d93734f72a1ab80143ffcf2e40f38de4fd7d10a8c198dfd6b968518"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.24-0312/Lithic_#{version}.dmg"
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
