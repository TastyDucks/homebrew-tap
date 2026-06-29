class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.236/darwin/arm64/nebius", using: :nounzip
      sha256 "c1b81ba3fc630ba96e136075f3ede199a389aed220d6987f3d66defc047d2266"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.236/darwin/x86_64/nebius", using: :nounzip
      sha256 "7696f10c1fa02adba4e716c3aa2e577d8611d08b9e88533227334d3e39b43060"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.236/linux/arm64/nebius", using: :nounzip
      sha256 "f24bf625d79a87e8f5391bd6c1021c723368a176c639bfa8157d23f9f95895ee"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.236/linux/x86_64/nebius", using: :nounzip
      sha256 "9eef4362d4f9718734b7156ab1a5d438d935b9fb422fc4b8d15d5b1c654c20ca"
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
