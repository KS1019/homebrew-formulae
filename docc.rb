class Docc < Formula
    desc "Unofficial tap for swift-docc"
    homepage "https://github.com/apple/swift-docc"
    url "https://github.com/apple/swift-docc/archive/refs/tags/swift-5.6-DEVELOPMENT-SNAPSHOT-2022-01-11-a.tar.gz"

    depends_on :xcode => ["13.0", :build]
  
    uses_from_macos "swift"
    def install
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/hondana"
    end
  
    test do
      system "false"
    end
  end
