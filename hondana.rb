class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana.git"
    sha256 "OLDSHA to be updated"
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
