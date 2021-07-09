class BashTpl < Formula
  desc "A smart, lightweight shell script templating engine, written in Bash"
  homepage "https://github.com/TekWizely/bash-tpl"
  url "https://github.com/TekWizely/bash-tpl/releases/download/v0.2.0/bash-tpl"
  sha256 "f90044ab42236c71d86934e3d166bb86d241d8182f78ddc6b60429aab93efa9f"

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
