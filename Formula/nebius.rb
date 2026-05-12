class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.213/darwin/arm64/nebius", using: :nounzip
      sha256 "b74a011e39466efbe869aed70a10fed833850cc3a7dd658b4a0273b30a49cfbd"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.213/darwin/x86_64/nebius", using: :nounzip
      sha256 "4918b8c35394313fa00ed5d6fe713b2b552fc6888e20205f3e71299b3944ff0b"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.213/linux/arm64/nebius", using: :nounzip
      sha256 "259246b313ef66dbac1f11ed7a9557775f18434159665d2cb37748aedb65f6ea"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.213/linux/x86_64/nebius", using: :nounzip
      sha256 "e03c6a46ee71effca329a28cfb814d50a38f62dc5762e973313b977a4d6aef74"
    end
  end

  def install
    bin.install cached_download => "nebius"
    (bin/"nebius").chmod 0755

    generate_completions_from_executable(bin/"nebius", "completion", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebius version")
  end
end
