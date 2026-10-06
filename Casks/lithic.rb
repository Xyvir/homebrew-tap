cask "lithic" do
  version "10.06.26-0355"
  sha256 "970aeae46544c9ee3560a22185b857dd7b1716d625a9775e94a244995ae03b58"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.06-0355/Lithic_#{version}.dmg"
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
