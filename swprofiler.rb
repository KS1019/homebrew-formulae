class Swprofiler < Formula
  desc "Simple profiler for compilation time of your Swift project, written in Swift."
  homepage "https://github.com/KS1019/SwiftyProfiler"
  url "https://github.com/KS1019/SwiftyProfiler.git", tag: "0.0.5", revision: "fdd49fe43243d64acc187239ee00a82cd446cb25"
  sha256 "c18aa185ed7c7e18c4499aa213781fca75e7a6923b596f35ab26c38009e90600"
  license ""

  depends_on :xcode => ["10.0", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "false"
  end
end
