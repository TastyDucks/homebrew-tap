class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.238/darwin/arm64/nebius", using: :nounzip
      sha256 "86af304ae5997fe2c4eb2273655625cf5a6c10ba029af4a29e4ff71c2a139b8a"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.238/darwin/x86_64/nebius", using: :nounzip
      sha256 "c36fc3c935159ea9e0e10cceb4b804d188f9ab89d1cce8b9709a3f445c48c083"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.238/linux/arm64/nebius", using: :nounzip
      sha256 "89713cb1a2a8b8623a17191c0bb68ae5a385c8cd5c3203d01a60a3b6e11e2c94"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.238/linux/x86_64/nebius", using: :nounzip
      sha256 "019e9cab1773a18c2a91958dab3c445cc31f8bce9c93f77c60e3a3a39afd6a06"
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
