class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.2.0/ifg-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "104baafee56b5aa4aa697c783157cbbb7c1b2daf25450471b4863b206c6ee616"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.2.0/ifg-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2bc05c722bf1c8a6d876ce44eb1107496d7d8793f6d3550c2ff58c0580ff7e3e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.2.0/ifg-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7528c85351a8db4d6ddda1f656828d03f59ea844f8426871e756e889e362431e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.2.0/ifg-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "de21993f09cd07520021719deac512e0a090299d0d07a10a54eed4012945dd0a"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
