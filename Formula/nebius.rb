class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.245/darwin/arm64/nebius", using: :nounzip
      sha256 "baf2b48c63ea95503b2a52d52ea770571f28cf3af36f4567e34f72f3ba4a4d95"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.245/darwin/x86_64/nebius", using: :nounzip
      sha256 "8f91438cd1ee3f717fd34d80ccba55bc5d483a9a0feed09b04364cbd395bca7d"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.245/linux/arm64/nebius", using: :nounzip
      sha256 "c912b5ece45264af597cc002ba73954e9681d561215c409c18e25ec5b2f603c5"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.245/linux/x86_64/nebius", using: :nounzip
      sha256 "581c58139414927351ce36b0d4ac0692a5f5bddc08b7546bc704a546f056b9df"
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
