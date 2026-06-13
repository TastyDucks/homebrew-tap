class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.227/darwin/arm64/nebius", using: :nounzip
      sha256 "aad5994b5eec90da9da7ef7f19a31d5ae0e6144e7f3dec47bf1fee7a13e7f4fc"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.227/darwin/x86_64/nebius", using: :nounzip
      sha256 "4cd222b1fa269bb33ce63346a3906d5d338e5e309ec7f65c1d67847d57b6ad57"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.227/linux/arm64/nebius", using: :nounzip
      sha256 "0d9e90ccddfaa73a250e8975abcafdf7910e83d26aad33d09ad99ada64c3a396"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.227/linux/x86_64/nebius", using: :nounzip
      sha256 "23d3d816104b005bef73fa958d806981b80ccab843f91572b580b17c688b6f62"
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
