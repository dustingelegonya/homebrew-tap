cask "orphanedwindowninja" do
  version "1.0.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  url "https://github.com/dustingelegonya/OrphanedWindowNinja/releases/download/v#{version}/OrphanedWindowNinja.zip"
  name "OrphanedWindowNinja"
  desc "macOS utility"
  homepage "https://github.com/dustingelegonya/OrphanedWindowNinja"
  app "OrphanedWindowNinja.app"
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/OrphanedWindowNinja.app"], sudo: false
  end
end
