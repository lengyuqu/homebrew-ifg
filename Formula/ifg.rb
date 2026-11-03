class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.0/ifg-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "794552a254ee1ca37add98bbeefe1f12d238b364a9ad05da471177d9e141a027"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.0/ifg-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "1de4030342a6ef03f5bc88170ac8677a604569009fda2c1fbca3827469c94f3d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.0/ifg-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "085f82b58d55c4c5ec0d4f5773f1a345317a6e9f6710ac5dab445959f800db2d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.7.0/ifg-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e4c6eb1de15403a992b6b3efb48328ca8c7e46f43cfa608db6e5c7a893755d77"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
