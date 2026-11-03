class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.1/ifg-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "ae5b74bbbd0fe5348e728ebdf06c6581ca96eacae8f3e3766dfdf969202d88d9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.1/ifg-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "5fbf2c3ec128a7c810ff3dbbd19fa9b8f038c0ae7dbd0ed6292c5f6d43b0829e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.1/ifg-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d965c3dd980db4ec65309de8d4b29d86ec3056458967948c32d0438823cc61ae"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.1/ifg-0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4f7083c29324e9f4f609abdbb1e70b0fc945f3bb166c9efffd090791de702b3a"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
