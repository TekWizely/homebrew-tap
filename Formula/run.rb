class Run < Formula
  desc "Easily manage and invoke small scripts and wrappers"
  homepage "https://github.com/TekWizely/run"
  url "https://github.com/TekWizely/run/archive/v0.11.1.tar.gz"
  sha256 "18f2d5a61c29b8de5dab9581b46efdd815ea367454acec719108c4f3742375db"

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
