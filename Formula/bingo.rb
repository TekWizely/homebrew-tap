class Bingo < Formula
  desc "The missing package manager for golang binaries"
  homepage "https://github.com/TekWizely/bingo"
  url "https://github.com/TekWizely/bingo/archive/v0.2.0.tar.gz"
  sha256 "ddad5148d2b2db072658367d2943affc1bbd41095629a21adff0d20f64ce6711"

  depends_on "run"

  def install
    bin.install "bingo"
  end

  test do
    text = "v0.2.0"
    task = "version"
    assert_equal text, shell_output("#{bin}/#{name} #{task}").chomp
  end
end
