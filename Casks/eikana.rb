cask "eikana" do
  version "0.0.6"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "19f56afb49086ffc060a90a0f077698b5fe4ce11270a5b3f12bd7c745935f523"
  
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
