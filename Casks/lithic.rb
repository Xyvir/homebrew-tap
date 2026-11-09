cask "lithic" do
  version "11.08.26-2306"
  sha256 "6bc647351cc4c08109e752ee5f7cd2b06652f3b22f0401f99808fddd8c8f763f"

  url "https://github.com/Xyvir/Lithic-UK/releases/download/build-2026.11.08-2306/Lithic_#{version}.dmg"
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
