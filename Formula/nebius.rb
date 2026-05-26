class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.217/darwin/arm64/nebius", using: :nounzip
      sha256 "a03c4971bd0139cf3c0db923030845a936d94448a77b7adefdb4ee2cc353fd17"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.217/darwin/x86_64/nebius", using: :nounzip
      sha256 "9bbeb9b967f36eb697b4de94f44f08a1aa20c67ce1bc002392906b32327a6a7a"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.217/linux/arm64/nebius", using: :nounzip
      sha256 "ef3cea57b0785e24c65260dff69695fb0a834126dde3adf13316eed91565d85a"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.217/linux/x86_64/nebius", using: :nounzip
      sha256 "0fc81a2e69b8bd3766f7d67f2a2bdcd09fcb63ab8776ffa1a867337cad7a45e2"
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
