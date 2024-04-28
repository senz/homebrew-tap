# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "webcord" do
  arch arm: "arm64", intel: "x64"
  platform = on_arch_conditional arm: "arm64", intel: "x64"

  version "4.8.0"
  sha256 arm: "5e7f599f284b0d8cb6c967af5485d057d86eaaef352dce02499d1fb5abce4472",
        intel: "0a504b5b4e0a8cd79804d180f37681ce82a0930af80efdb1d35d3610adad3f5b"

  url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-#{platform}.dmg"
  name "WebCord"
  desc "A Discord and SpaceBar :electron:-based client implemented without Discord API."
  homepage "https://github.com/SpacingBat3/WebCord"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_latest
  end

  app "WebCord.app"
  binary "#{appdir}/WebCord.app/Contents/MacOS/webcord"
  depends_on macos: ">= :catalina"

  caveats <<~EOS
    To run the app, you need to remove the quarantine attribute, since its insigned.
    xattr -d com.apple.quarantine  /Applications/WebCord.app
  EOS

  uninstall quit: "com.electron.webcord"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Application Support/WebCord",
    "~/Library/Preferences/com.electron.webcord.plist",
    "~/Library/Saved Application State/com.electron.webcord.savedState"
  ]
end
