class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.270/darwin/arm64/nebius", using: :nounzip
      sha256 "2492d26f302ba322e9174453afa9c8a75b6f2e46bd09e3b39095bbbc5e23db06"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.270/darwin/x86_64/nebius", using: :nounzip
      sha256 "130f626e4bccf450e0463d999f23e861633587cf1a61f13a4be32d794b456623"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.270/linux/arm64/nebius", using: :nounzip
      sha256 "a3d79b6288cd1e017d2bd97f9caecc9364d38d68979dbf2d79cda2b46a7fc2a6"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.270/linux/x86_64/nebius", using: :nounzip
      sha256 "110090a219ff5cd5353d25a261718d55faf89949341b7135ea19f6329994bef2"
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
