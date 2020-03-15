class Run < Formula
  desc "Easily manage and invoke small scripts and wrappers"
  homepage "https://github.com/TekWizely/run"
  url "https://github.com/TekWizely/run/archive/v0.7.2.tar.gz"
  sha256 "c542b523c67e3cd2ca05a8e2f92cca607181a68518b2568a68b76ed9f700d6e0"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-w -s -X \"main.BuildTool=brew via tekwizely/tap/run\"", "-o", bin/name
  end

  test do
    text = "Hello Homebrew!"
    task = "hello"
    (testpath/"Runfile").write <<~EOS
      #{task}:
        echo #{text}
    EOS
    assert_equal text, shell_output("#{bin}/#{name} #{task}").chomp
  end
end
