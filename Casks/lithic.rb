cask "lithic" do
  version "10.27.26-0117"
  sha256 "42f5358cdeb2a959c48191cad3ddd9dc60cd85a369ea1117d6d2ba82937fbeca"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.27-0117/Lithic_#{version}.dmg"
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
