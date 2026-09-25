cask "mozaic" do
  version "1.0"
  sha256 "25b9305a8bf7a1cffb8ca5ce260e779da1230fcfdb935c67d2ce7d281837082a"

  url "https://github.com/Ryz3nPlayZ/Mozaic/releases/download/v#{version}/Mozaic.dmg"
  name "Mozaic"
  desc "Native macOS client for YouTube Music and YouTube"
  homepage "https://github.com/Ryz3nPlayZ/Mozaic"

  auto_updates true
  depends_on macos: :sonoma

  app "Mozaic.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Mozaic.app"], must_succeed: false
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/Mozaic.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Mozaic",
    "~/Library/Caches/com.zemuliu.Mozaic",
    "~/Library/Preferences/com.zemuliu.Mozaic.plist",
    "~/Library/Saved Application State/com.zemuliu.Mozaic.savedState",
    "~/Library/WebKit/com.zemuliu.Mozaic",
  ]
end
