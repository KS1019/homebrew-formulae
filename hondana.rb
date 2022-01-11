class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana/archive/0.0.3-d.tar.gz"
  
    license "MIT"

    depends_on :xcode => ["10.0", :build]
  
    def install
      system "make", "install", "prefix=#{prefix}"
    end
  
    test do
      system "false"
    end
  end
