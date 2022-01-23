class Swprofiler < Formula
  desc "Simple profiler for compilation time of your Swift project, written in Swift."
  homepage "https://github.com/KS1019/SwiftyProfiler"
  url "https://github.com/KS1019/SwiftyProfiler.git", tag: "v0.0.13", revision: "d5908a9f02220dba64294a27dcf69c8c5526c6a1"

  depends_on :xcode => ["10.0", :build]
  
  uses_from_macos "swift"
  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/swprofiler"
  end

  test do
    system "false"
  end
end
