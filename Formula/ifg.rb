class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.0/ifg-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "15ca557f7859f75a0776ac15fd4d5ed66e5fa2454d8b3641526a30edf3981632"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.0/ifg-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "1868c6bc5dad2b51a0baa7757a4f195ef2fc567be859a6e68cf7301758e507b0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.0/ifg-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f9657d98ac69e93ffb6da3e6be4e22478dc194b03bc76cbb0da714d00055d5b8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.0/ifg-0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bf0188412a1ef1e20f9228fdc47bd632f4a7fb8f4f9fd0ee25f5d6f65be18b58"
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
