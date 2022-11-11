class BashTpl < Formula
  desc "Bash-TPL is a smart, lightweight shell script templating engine, written in Bash"
  homepage "https://github.com/TekWizely/bash-tpl"
  url "https://github.com/TekWizely/bash-tpl/releases/download/v0.5.0/bash-tpl"
  sha256 "2bc29c2fc6b6abd9d0773e69b3952024eb8a628d9b8d7a6d257b76719d6738ae"

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
