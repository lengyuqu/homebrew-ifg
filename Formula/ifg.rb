class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.0/ifg-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "7735ad0b252872d6591db3f58b8e998743526ede05a48e7528a2cc9796b7549f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.0/ifg-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "90911ccea80eaec546576928e624e5ea3b3e775b04cada5b50ecba79ef486521"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.0/ifg-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3ad80e2728468ccef7fb9967830d7550489c0241b29a0b101d53893475c91adb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.0/ifg-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "13c70172c37f8eba63b58b5fec454cb84433a933e398918433cd7e011544aaa0"
    end
  end

  def install
    bin.install "ifg"
    # The release archive ships the generated man pages alongside the binary.
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
