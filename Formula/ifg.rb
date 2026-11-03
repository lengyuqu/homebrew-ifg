class Ifg < Formula
  desc "Command-line client for IronForge (repos, issues, PRs, CI, releases)"
  homepage "https://github.com/lengyuqu/ifg"
  url "https://github.com/lengyuqu/ifg/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.1.0/ifg-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8c97c8c9a682b4dbb967b87c5ea549e98ec4d6625880ca69af15e78246e48c6b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.1.0/ifg-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d6524d455890dd1395f92ab513c6e46f842ba88866c0ab221be9579bbeb35d4b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.1.0/ifg-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d7bc6bf5f473e7bb2e50324cf62c5429bf534135b0bf0149b4d5d168e2f56a28"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lengyuqu/ifg/releases/download/v0.1.0/ifg-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "effe7b0416d3426ebbbd9d595308bc34a5b80fbb25d380a364073188c72864e9"
    end
  end

  def install
    bin.install "ifg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ifg --version")
  end
end
