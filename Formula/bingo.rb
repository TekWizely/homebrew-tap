class Bingo < Formula
  desc "The missing package manager for golang binaries"
  homepage "https://github.com/TekWizely/bingo"
  url "https://github.com/TekWizely/bingo/archive/v0.1.0.tar.gz"
  sha256 "8f8e75de0c56b44a89342b4b2adcbdad8c3afe106be26cc1a48fbbb4939a5642"

  depends_on "run"

  def install
    bin.install "bingo"
  end

  test do
    text = "v0.1.0"
    task = "version"
    assert_equal text, shell_output("#{bin}/#{name} #{task}").chomp
  end
end
