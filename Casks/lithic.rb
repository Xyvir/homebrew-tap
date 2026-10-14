cask "lithic" do
  version "10.13.26-2227"
  sha256 "375a8bf312e8573e72a5b1a49000cbf74a5c698d1e5aa349b9b584bdfab49377"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.13-2227/Lithic_#{version}.dmg"
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
