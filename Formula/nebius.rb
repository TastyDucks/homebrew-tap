class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.269/darwin/arm64/nebius", using: :nounzip
      sha256 "51c53e9ba0f5efe791ae7f42833127c2c0fd82f8b59c2c7908e3c81b09a9b47f"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.269/darwin/x86_64/nebius", using: :nounzip
      sha256 "aa8f021bc1b725277e2885a965b85ad96257fc5105aa162e054cf7d64da0d54d"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.269/linux/arm64/nebius", using: :nounzip
      sha256 "91edf41c2ac03a551b84347c1fff739d55f32d968df184bc9b08e4780de71bb9"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.269/linux/x86_64/nebius", using: :nounzip
      sha256 "fd8c967cdfbd6c28f69979c87c1c8f9c52244219ed4981c48f9b40be314bed98"
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
