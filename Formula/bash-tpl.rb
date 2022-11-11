class BashTpl < Formula
  desc "Smart, lightweight shell script templating engine, written in Bash"
  homepage "https://github.com/TekWizely/bash-tpl"
  url "https://github.com/TekWizely/bash-tpl/releases/download/v0.7.0/bash-tpl"
  sha256 "8eafa31e245779b19f50aeba5c52d620132894b4d33846a2d979d73ebf481481"

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
