class BashTpl < Formula
  desc "A smart, lightweight shell script templating engine, written in Bash"
  homepage "https://github.com/TekWizely/bash-tpl"
  url "https://github.com/TekWizely/bash-tpl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1dfc1172d89bae0dd4b2335f79499af2629c3e7b51ead5e50044e40545feebac"

  depends_on "bash"

  def install
    bin.install "bash-tpl"
  end

  test do
    tpl = "Hello <% $NAME %>!"
    text = "Hello Homebrew!"
    (testpath/"test.tpl").write <<~EOS
        #{tpl}
    EOS
    assert_equal text, shell_output("NAME='Homebrew' #{bin}/#{name} test.tpl").chomp
  end
end
