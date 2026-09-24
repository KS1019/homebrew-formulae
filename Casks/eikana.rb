cask "eikana" do
  version "0.1.0"
  sha256 "2167d2e6ab6fd1f848f490b965b813396e74052ac4b2c5f570dae498bd84675a"

  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "eikana.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{appdir}}/eikana.app"],
        must_succeed: false
    run "/usr/bin/codesign",
        args: ["-f", "-s", "-", "--deep", "{{appdir}}/eikana.app"]
  end

  uninstall quit:   "jp.cmd.eikana",
            script: {
              executable:   "/usr/bin/tccutil",
              args:         ["reset", "Accessibility", "jp.cmd.eikana"],
              must_succeed: false,
            }

  caveats "#{token} is not notarized; installation automatically removes the 'com.apple.quarantine' attribute."
  caveats do
    unsigned_accessibility
  end
end
