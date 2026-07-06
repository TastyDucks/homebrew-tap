class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.240/darwin/arm64/nebius", using: :nounzip
      sha256 "c54d9a3f36d5bb6bb98a6f0c44650d5fcb9910f30099b4bf4d9cf5ff46e9d284"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.240/darwin/x86_64/nebius", using: :nounzip
      sha256 "0811997f05dd2f65202535b2ff06ed89060529463d633fcffb989156212b158d"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.240/linux/arm64/nebius", using: :nounzip
      sha256 "803e96d9f8a2aefdfa1f7b0ce216bde47acca4a3c4351ddbd2fd5c803f74bb61"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.240/linux/x86_64/nebius", using: :nounzip
      sha256 "e8c0e6305e426b488708d0c59c507ed47fe38922a07879edb73d850853b435b4"
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
