cask "jellyfishninja" do
  version "1.0"
  sha256 "a86025f3ae99c5052b372e6437501b4ce994e85822c7e00cea413509e5fe969b"

  url "https://github.com/dustingelegonya/jellyfish.ninja/releases/download/v#{version}/JellyfishNinja-#{version}.zip"

  name "JellyFish.Ninja"
  desc "Quick Look extension for Fish shell scripts with syntax highlighting"
  homepage "https://github.com/dustingelegonya/jellyfish.ninja"

  depends_on macos: ">= :ventura"

  app "JellyfishNinja.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/JellyfishNinja.app"], sudo: false
    system_command "/usr/bin/qlmanage", args: ["-r"], sudo: false
  end

  uninstall_postflight do
    system_command "/usr/bin/qlmanage", args: ["-r"], sudo: false
  end

  zap trash: [
    "~/Library/Containers/jellyfish.ninja.JellyfishNinjaQuickLook",
  ]
end
