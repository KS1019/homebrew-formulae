cask "eikana" do
  version "0.1.0"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "2167d2e6ab6fd1f848f490b965b813396e74052ac4b2c5f570dae498bd84675a"
  
  livecheck do
    url :url
    strategy :github_latest
  end

  caveats "#{token} is not notarized and will delete 'com.apple.quarantine' attribute automatically during the installation."
  caveats do
    unsigned_accessibility
  end
  
  depends_on macos: ">= :sonoma"
  
  app "eikana.app"

  postflight do
    system "xattr -d com.apple.quarantine #{appdir}/eikana.app"
    system "codesign -f -s - --deep #{appdir}/eikana.app"
  end

  uninstall_preflight do
    system "osascript -e 'quit app \"#{token}\"'"
    system "tccutil reset Accessibility jp.cmd.eikan"
  end
end
