class Hondana < Formula
  desc "CLI tool to manage bookmarklets"
  homepage "https://github.com/KS1019/Hondana"
  url "https://github.com/KS1019/Hondana/archive/refs/tags/0.0.8.tar.gz"
  sha256 "24c90e8ff1fbc0848e5a45ef48742b23a0f7813797f2da8de1b07c171ac4e16c"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", *std_swift_args
    bin.install ".build/release/hondana"
    generate_completions_from_executable(bin/"hondana", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hondana --version")
    assert_match "#compdef hondana", shell_output("#{bin}/hondana --generate-completion-script zsh")
  end
end
