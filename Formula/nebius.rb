class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.257/darwin/arm64/nebius", using: :nounzip
      sha256 "069238a44893982388302244a0b0c3b7b59533b98a764f3bb3d13b65180ac6eb"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.257/darwin/x86_64/nebius", using: :nounzip
      sha256 "e9c1a5655aeca667979e759edbc597b9e27603649cf975248c5ac2b443e2a016"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.257/linux/arm64/nebius", using: :nounzip
      sha256 "97bc60583ebeb34650b474f689789050bc850f0907cfc4e48ce2995dfeb09b12"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.257/linux/x86_64/nebius", using: :nounzip
      sha256 "3fb6960bc2145651f40ffbb02adeae4b0b3e043453728ef67b2265e2eea90022"
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
