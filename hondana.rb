class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana.git"
    tag "0.0.1"
    revision "05f0a7df21190740fdccc09dffad621bce8015e0"
  
    depends_on :xcode => ["10.0", :build]
  
    def install
      system "make", "install", "prefix=#{prefix}"
    end
  
    test do
      system "false"
    end
  end