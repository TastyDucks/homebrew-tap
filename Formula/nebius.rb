class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.265/darwin/arm64/nebius", using: :nounzip
      sha256 "7bb0327e8285b1d5afb3fd54fb7fd0ff992df92cb4a35839a05c6ae2024fca51"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.265/darwin/x86_64/nebius", using: :nounzip
      sha256 "c96662aa8f882232f939e45f58b217d0264a84af24225170e2da18b7b0bfa6ee"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.265/linux/arm64/nebius", using: :nounzip
      sha256 "11bd157408a9a4ce84cca7fe9314a721840484f3c3f5db0ca7cd2b18549a7b1b"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.265/linux/x86_64/nebius", using: :nounzip
      sha256 "d1590a724ba48dc64180762f3361307b762a9d6e88c5eac6896404688cf48f5e"
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
