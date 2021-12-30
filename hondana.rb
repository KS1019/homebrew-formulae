class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana.git", tag: "0.0.2", revision: "aee52bdc04fbdda8f5f7d3a77ceed5b363457b75"
  
    license "MIT"

    depends_on :xcode => ["10.0", :build]
  
    def install
      system "make", "install", "prefix=#{prefix}"
    end
  
    test do
      system "false"
    end
  end
