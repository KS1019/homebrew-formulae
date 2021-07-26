class Swprofiler < Formula
  desc "Simple profiler for compilation time of your Swift project, written in Swift."
  homepage "https://github.com/KS1019/SwiftyProfiler"
  url "https://github.com/KS1019/SwiftyProfiler.git", tag: "0.0.5", revision: "fdd49fe43243d64acc187239ee00a82cd446cb25"

  depends_on :xcode => ["10.0", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "false"
  end
end
