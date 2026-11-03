class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.6.0/ifg-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "f3cc5e88c8fe1a9a403d40fd6fb2e79d66d122439790867648d65a662a0cb856"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.6.0/ifg-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "50f4ce29f731338287304ac913303404ec233f90ebf3156470b057b8ad9ceeb4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.6.0/ifg-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f161721783eabe5dea46cb1a62c2c57c80c72101691629cea723099d3f743133"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.6.0/ifg-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c5ff9618e46eb3a446536af574d38a46fcf12c3c537d2ce820475464786c01d1"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
