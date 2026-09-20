class Swprofiler < Formula
  desc "Profiler for Swift project compilation time"
  homepage "https://github.com/KS1019/SwiftyProfiler"
  url "https://github.com/KS1019/SwiftyProfiler.git", tag: "v0.0.13", revision: "d5908a9f02220dba64294a27dcf69c8c5526c6a1"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    system "swift", "build", *std_swift_args
    bin.install ".build/release/swprofiler"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swprofiler --version")
    assert_match "Product Name", shell_output("#{bin}/swprofiler --help")
  end
end
