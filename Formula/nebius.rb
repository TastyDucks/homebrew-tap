class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.231/darwin/arm64/nebius", using: :nounzip
      sha256 "dc1990611618b5362ede3fc7ca60f845912e5eb04dac4946146dc6930d2d88e8"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.231/darwin/x86_64/nebius", using: :nounzip
      sha256 "835fc3482d61653782c3a55af68a960d4e0e53b482c9d3e18099daf6eb20b6fa"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.231/linux/arm64/nebius", using: :nounzip
      sha256 "2840a6a851468999161c6d9e0ab27ab61991b4c241f76eac0a5d90ccb6a6c0c0"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.231/linux/x86_64/nebius", using: :nounzip
      sha256 "143faa5c3adf383508c58df63b31dbbe9bf3bbdf652d63e522f7b6a5720e89ab"
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
