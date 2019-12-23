class Run < Formula
  desc "Easily manage and invoke small scripts and wrappers"
  homepage "https://github.com/TekWizely"
  url "https://github.com/TekWizely/run/archive/v0.6.4.tar.gz"
  sha256 "ac667bf25180b73119526453168b40c935efba2de84b4faae55ed4bc01fe8ad8"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-w -s -X main.GitSummary=brew", "-o", bin/name
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
