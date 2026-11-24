class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  license "MIT"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.1/ifg-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "30e9e1164b80e640520ed0cad9ee178d1ef99cbb6c6058c5e494fa63ae87f4d6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.1/ifg-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "de4abbf319bc8a6fab4407d6a6f61bb54b9580f038807ebb9f8553bdfeeb1843"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.1/ifg-0.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "62363a039efee958f224a62c4ea0ee5b55f2f8f8dcbc3170dd39759f35c672ec"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.9.1/ifg-0.9.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e7e8d0c4c7211fb98fede7d679d5fd2b19381bad7a97861d7944f93117779fa9"
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
