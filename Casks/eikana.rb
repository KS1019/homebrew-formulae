cask "eikana" do
  version "0.0.4"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "cb3192cacfc6ce855b9b77884294408497bb6455512bf158aa8fb82d696e43f8"
  
  livecheck do
    url :url
    strategy :github_latest
  end

  caveats "#{token} is not notarized and will delete 'com.apple.quarantine' attribute automatically during the installation."
  
  depends_on macos: ">= :sonoma"
  
  app "eikana.app"

  postflight do
    system "xattr -d com.apple.quarantine #{appdir}/eikana.app"
  end
end
