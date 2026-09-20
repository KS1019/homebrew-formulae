class Docc < Formula
  desc "Documentation compiler for Swift frameworks and packages"
  homepage "https://github.com/apple/swift-docc"
  url "https://github.com/apple/swift-docc/archive/refs/tags/swift-5.6-DEVELOPMENT-SNAPSHOT-2022-01-11-a.tar.gz"
  sha256 "6b3c40eee6ab12c5fd3964469426a67685974d32ef3e92be964d12793949ade1"
  license "Apache-2.0" => { with: "Swift-exception" }

  depends_on xcode: ["13.0", :build]
  depends_on :macos

  def install
    system "swift", "build", *std_swift_args
    bin.install ".build/release/docc"
  end

  test do
    assert_match "Converts documentation from a source bundle", shell_output("#{bin}/docc convert --help")
  end
end
