cask "eikana" do
  version "0.0.2"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "ff891db2e298a7bc944bc37be3608d2a4adf44072031e7f4aeeef13a6a54f56e"
  
  livecheck do
    url :url
    strategy :github_latest
  end

  caveats "#{name} is not notarized and will delete com.apple.quarantine attribute automatically during the installation."
  
  depends_on macos: ">= :sonoma"
  
  app "eikana.app"

  def post_flight
    system "xattr -d com.apple.quarantine #{appdir}/eikana.app"
  end
end
