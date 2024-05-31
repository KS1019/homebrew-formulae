cask "eikana" do
  version "0.0.2"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  hasCodeSignTool = system "which codesign > /dev/null 2>&1"
  
  
  livecheck do
    url :url
    strategy :github_latest
  end
  
  if not hasCodeSignTool
    caveats do
      unsigned_accessibility
    end
  end
  
  depends_on macos: ">= :sonoma"
  
  app "eikana.app"

  def post_install
    if hasCodeSignTool
      system "codesign --force --deep -s - /Applications/#{name}.app"
    end
  end
end
