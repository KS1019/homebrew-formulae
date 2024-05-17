cask "eikana" do
  version "0.0.1"
  url "https://github.com/KS1019/eikana/releases/download/#{version}/eikana.zip"
  name "eikana"
  desc "Input Mode Switcher for Japanese and English / USキーボードで日英入力切り替えを行うアプリ"
  homepage "https://github.com/KS1019/eikana"
  sha256 "03e15c75b1d71a265b9c063fa0e6d3327d7a919ce922e8e4ae167788ebd3d1ba"

  hasCodeSignTool = system "which codesign > /dev/null 2>&1"
  
  
  livecheck do
    url :url
    strategy :github_latest
  end
  
  caveats do
    if hasCodeSignTool
      caveats "Self signing #{name}.app with codesign tool"
    else
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
