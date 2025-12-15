cask "jellyfishninja" do
  version "1.0.1"
  sha256 "c3319f1217e5672750b8bcd1d993af12a94d099f551bed853015961d9cd65a45"

  url "https://github.com/dustingelegonya/jellyfish.ninja/releases/download/v#{version}/JellyfishNinja-#{version}.zip"

  name "JellyFish.Ninja"
  desc "Quick Look extension for Fish shell scripts with syntax highlighting"
  homepage "https://github.com/dustingelegonya/jellyfish.ninja"

  depends_on macos: ">= :ventura"

  app "JellyfishNinja.app"

  postflight do
    # Clear quarantine flags
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/JellyfishNinja.app"], sudo: false
    # Reset Quick Look manager
    system_command "/usr/bin/qlmanage", args: ["-r"], sudo: false
    # Launch and quit app to register extension with Launch Services
    system_command "/usr/bin/open", args: ["-a", "#{appdir}/JellyfishNinja.app"], sudo: false
    sleep 2
    system_command "/usr/bin/osascript", args: ["-e", "quit app \"JellyfishNinja\""], sudo: false
  end

  uninstall_postflight do
    system_command "/usr/bin/qlmanage", args: ["-r"], sudo: false
  end

  zap trash: [
    "~/Library/Containers/jellyfish.ninja.JellyfishNinjaQuickLook",
  ]
end
