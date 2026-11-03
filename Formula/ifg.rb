class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.4.0/ifg-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "5c1414ca86b380dc884656ee815fd571ce1ff4823d46c4e509512718159a3f49"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.4.0/ifg-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "e5045044f4000cc4cecf65094234f4eeb94f1b6a6a82dfbff7c50079a17b7941"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.4.0/ifg-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b9b034173c8817c3427edacad2397d0aa78f521973111a3b984d111606324276"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.4.0/ifg-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fd184ad26a90e34a1f82fef5c85b55a1ae6d370b7d0862520a1b57a6afac32d0"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
