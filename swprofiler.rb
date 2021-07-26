class Swprofiler < Formula
  desc "Simple profiler for compilation time of your Swift project, written in Swift."
  homepage "https://github.com/KS1019/SwiftyProfiler"
  url "https://github.com/KS1019/SwiftyProfiler.git", tag: "0.0.6", revision: "1bcf9e745b6b7c57fd5e3938151baf66155bd7ec"

  depends_on :xcode => ["10.0", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "false"
  end
end
