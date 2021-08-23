class Bingo < Formula
  desc "The missing package manager for golang binaries"
  homepage "https://github.com/TekWizely/bingo"
  url "https://github.com/TekWizely/bingo/archive/v0.3.0.tar.gz"
  sha256 "9fb7eb53490cc451be8a7abb2d459cb44f868ed4cefdef612b8676e13611e8d2"

  depends_on "run"

  def install
    bin.install "bingo"
  end

  test do
    text = "v0.3.0"
    task = "version"
    assert_equal text, shell_output("#{bin}/#{name} #{task}").chomp
  end
end
