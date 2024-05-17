cask "eikana" do
  version "0.0.1"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "2602acfb02cdeee7cc2989bac3d562bacb326aab7a4c3bbdb32df70f66738f65"
  
  
  livecheck do
    url :url
    strategy :github_latest
  end
  
  caveats do
    unsigned_accessibility
  end
  
  depends_on macos: ">= :sonoma"
  
  app "eikana.app"
end
