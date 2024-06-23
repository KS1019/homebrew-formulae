cask "eikana" do
  version "0.0.3"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "2ec13beeaa4c98537a49c114cb006075d6f0ce8bf596619082db3e9f610b0299"
  
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
