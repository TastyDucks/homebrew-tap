class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.232/darwin/arm64/nebius", using: :nounzip
      sha256 "7d2515932b272f4095a539b7a0c79f9f249ba353d1753a08b11d17f85d22f9bd"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.232/darwin/x86_64/nebius", using: :nounzip
      sha256 "b130aa13dfb86a6c22cef4016560109f0bf6c2a3c9f710dc29d28b62fbe41217"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.232/linux/arm64/nebius", using: :nounzip
      sha256 "f992faf0f472a552aa47db8352e400fc5e5c1e1d52df67d0fd6055d8b8fc81ef"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.232/linux/x86_64/nebius", using: :nounzip
      sha256 "7ab8d46fa1202a8af73df382379041b58d2d1f75bb432d7e46806210eeba6324"
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
