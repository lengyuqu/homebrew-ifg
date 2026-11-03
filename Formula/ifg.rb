class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.5.0/ifg-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "c2d451ba597a7048cd1fc35c4b6f24654bec5615ada4e28416c093ad0bbdb915"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.5.0/ifg-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "0bb593c105c880ee9dd52e22e0eb112e86dc54a02211c198530092f18a33e984"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.5.0/ifg-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c33fcdb9df4e3ef4658558a13b37c5b7476d54fd6fe484bc14bf0b6b02b5ac46"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.5.0/ifg-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ef87ec1041ab02f010c498ae20ecf3693949bc2d102e37c5f2693a8246c5de3b"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
