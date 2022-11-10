class Run < Formula
  desc "Easily manage and invoke small scripts and wrappers"
  homepage "https://github.com/TekWizely/run"
  url "https://github.com/TekWizely/run/archive/v0.10.0.tar.gz"
  sha256 "1db1d50ca5f97524e5e031ba6beedf49f2e2122f57901e20fdb994bcf887284f"

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
