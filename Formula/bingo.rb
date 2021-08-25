class Bingo < Formula
  desc "The missing package manager for golang binaries"
  homepage "https://github.com/TekWizely/bingo"
  url "https://github.com/TekWizely/bingo/archive/v0.3.1.tar.gz"
  sha256 "fa71b69f45912bfaf79500853807bd439427eeff6b6c053c88b7787baad73f06"

  depends_on "run"

  def install
    bin.install "bingo"
  end

  test do
    text = "v0.3.1"
    task = "version"
    assert_equal text, shell_output("#{bin}/#{name} #{task}").chomp
  end
end
