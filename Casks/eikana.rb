cask "eikana" do
  version "0.0.11"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "695cc2258f973199cd8e67ad993c3fd05b3d6e025b8e834efda1f9ccea438ff2"
  
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
