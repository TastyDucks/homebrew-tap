class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.228/darwin/arm64/nebius", using: :nounzip
      sha256 "5e9decbc836a4a81a8d6b6ecb59927d41b1f37e9c818325a67004a95ba4c943f"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.228/darwin/x86_64/nebius", using: :nounzip
      sha256 "6b7e9d5873e517253fe59485f98cf071194b815e662f9f0819484a5a6b6d787d"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.228/linux/arm64/nebius", using: :nounzip
      sha256 "5803377c025ed03df493726d463e25cdb82ad6b6626d2c6ae6eb0d7091dd9060"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.228/linux/x86_64/nebius", using: :nounzip
      sha256 "b68712247f6d32dcd5367e2d71ad289a0fbc0c117029969b08a2261f517e121d"
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
