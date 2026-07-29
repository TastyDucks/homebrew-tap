class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.251/darwin/arm64/nebius", using: :nounzip
      sha256 "419f8658cfce6de8a96b47ca46931ccf8589b0d3317bf2bc03a5330682ad0661"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.251/darwin/x86_64/nebius", using: :nounzip
      sha256 "1f71559454497d062035df58f6e1ecfef51cbe7565f28778941b2f89887e739a"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.251/linux/arm64/nebius", using: :nounzip
      sha256 "2d77770298a8dd080e87f39d601e201e8a3c01ccb3a46264f7abe5b5f13e9d4f"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.251/linux/x86_64/nebius", using: :nounzip
      sha256 "a41317c0905fe85dc702a58a5855a729763d6ad4f498bbb56195287826f46025"
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
