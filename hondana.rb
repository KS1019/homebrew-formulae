class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana/archive/0.0.6.tar.gz"
    sha256 "3265498428ccbc8535fa22fd5f6cab65f44e790cf9677294fe0a1c28a8e9931e"
    
    license "MIT"

    depends_on :xcode => ["10.0", :build]
  
    uses_from_macos "swift"
    def install
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/hondana"
    end
  
    test do
      system "false"
    end
  end
