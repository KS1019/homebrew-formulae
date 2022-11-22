class Hondana < Formula
    desc "CLI tool to manage your bookmarklets"
    homepage "https://github.com/KS1019/Hondana"
    url "https://github.com/KS1019/Hondana/archive/0.0.7.tar.gz"
    sha256 "0543b9ac78edad2717cc6b8aee77c4c7143415b5234c083c891bad63dbb04a3d"
    
    license "MIT"

    depends_on :xcode => ["10.0", :build]
  
    uses_from_macos "swift"
    def install
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/hondana"
      hondana = bin/"hondana"
      if hondana.exist? && hondana.executable?
          output = Utils.safe_popen_read(hondana, '--generate-completion-script', 'zsh')
          (zsh_completion/'_hondana').write output
          output = Utils.safe_popen_read(hondana, '--generate-completion-script', 'bash')
          (bash_completion/'hondana').write output
          output = Utils.safe_popen_read(hondana, '--generate-completion-script', 'fish')
          (fish_completion/'hondana.fish').write output
      end
    end
  
    test do
      system "false"
    end
  end
