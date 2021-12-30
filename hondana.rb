class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana.git", tag: "0.0.2-1", revision: "daa43bd4c46c87eb3b31f6e051f60bfeedbdf200"
  
    license "MIT"

    depends_on :xcode => ["10.0", :build]
  
    def install
      system "make", "install", "prefix=#{prefix}"
    end
  
    test do
      system "false"
    end
  end
