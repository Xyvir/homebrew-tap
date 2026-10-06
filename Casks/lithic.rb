cask "lithic" do
  version "10.06.26-1827"
  sha256 "e9bc6ab5e7be0425283ce1736aec4d6579573b94b50d2d793c081e3e4691a4ab"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.10.06-1827/Lithic_#{version}.dmg"
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
