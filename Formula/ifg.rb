class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.1/ifg-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "2ac7ad5f416af07f16cac8a8cdce2bd896bbeb15a318b041c5bd61316447f39d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.1/ifg-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "1308a4b32c2b7365f691a235b43906a3a58dd432351ee7b4e7848df4c5755cde"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.1/ifg-0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1008d53a863cbc2f799fd379257ce43c84c104204dabb439f618c3ed1aa768a6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.8.1/ifg-0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "32cb0d2dc44a230ab8e61967d0eb64b88b80a8d0ec25d60cc21bc83a4c5a51a4"
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
