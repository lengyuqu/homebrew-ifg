class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.3.0/ifg-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "b7e59d9aca189a04d48251594b097b7cf569db9caf67941aaf53ea789f9b2219"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.3.0/ifg-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "4e7f5dc6737818e9491e60cef542413cc00c2a998cdca9465e1b57daabb38a3b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.3.0/ifg-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5606c5a4e2f4a908bcf4ff167c4526ff0177a69c81dcc21d0499660b85f00754"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.3.0/ifg-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "57bb79d02dd8cbe6e92c50dab9c779706ed2f1be3fe4c387fbca31433f2fbdf2"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
