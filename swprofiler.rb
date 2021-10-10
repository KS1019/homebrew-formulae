class Swprofiler < Formula
  desc "Simple profiler for compilation time of your Swift project, written in Swift."
  homepage "https://github.com/KS1019/SwiftyProfiler"
  url "https://github.com/KS1019/SwiftyProfiler.git", tag: "0.0.8", revision: "43d9d0819c7ffb83226c8b19979309b67ef94a9e"

  depends_on :xcode => ["10.0", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "false"
  end
end
