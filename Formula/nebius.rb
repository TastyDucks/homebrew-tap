class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.250/darwin/arm64/nebius", using: :nounzip
      sha256 "6734bde5e5f27a92d3ca53593e12d2b330ec400c132c82ba328b1ed94addde80"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.250/darwin/x86_64/nebius", using: :nounzip
      sha256 "a24da23c335929076deed7dc97aae50b7616304023800235b4b9ac64a27dc6da"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.250/linux/arm64/nebius", using: :nounzip
      sha256 "b4b27a9302950446b2ac2b252df7628c7bb4b8a0875c65652b7a2dec309adabb"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.250/linux/x86_64/nebius", using: :nounzip
      sha256 "6179e010bca5fd830ec39b3dc352fa2f71edfe0e276ad2eef27a7a697ff54643"
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
