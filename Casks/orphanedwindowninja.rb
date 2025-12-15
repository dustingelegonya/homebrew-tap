cask "orphanedwindowninja" do
  version "1.0.0"
  sha256 "ab38ced6ce790f5edc81e40c785f01e197d666e37cf852fd7917313e29399cd8"
  url "https://github.com/dustingelegonya/OrphanedWindowNinja/releases/download/v#{version}/OrphanedWindowNinja.zip"
  name "OrphanedWindowNinja"
  desc "macOS utility"
  homepage "https://github.com/dustingelegonya/OrphanedWindowNinja"
  app "OrphanedWindowNinja.app"
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/OrphanedWindowNinja.app"], sudo: false
  end
end
