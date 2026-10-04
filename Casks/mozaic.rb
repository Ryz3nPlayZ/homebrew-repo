cask "mozaic" do
  version "1.1"
  sha256 "0195436fa529778d1b20027962dc66a7ad67248c1d61832cee782da321068483"

  url "https://github.com/Ryz3nPlayZ/Mozaic/releases/download/v#{version}/mozaic-v#{version}.dmg"
  name "Mozaic"
  desc "Native YouTube Music client with a companion notch app"
  homepage "https://github.com/Ryz3nPlayZ/Mozaic"

  auto_updates true
  depends_on macos: :sequoia

  app "Mozaic.app"
  app "Mozaic Notch.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Mozaic.app"], must_succeed: false
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/Mozaic.app"], must_succeed: false
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Mozaic Notch.app"], must_succeed: false
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/Mozaic Notch.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Mozaic",
    "~/Library/Caches/com.zemuliu.Mozaic",
    "~/Library/Caches/com.zemuliu.MozaicNotch",
    "~/Library/HTTPStorages/com.zemuliu.MozaicNotch",
    "~/Library/Preferences/com.zemuliu.Mozaic.plist",
    "~/Library/Preferences/com.zemuliu.MozaicNotch.plist",
    "~/Library/Saved Application State/com.zemuliu.Mozaic.savedState",
    "~/Library/WebKit/com.zemuliu.Mozaic",
  ]
end
