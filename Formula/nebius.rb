class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.259/darwin/arm64/nebius", using: :nounzip
      sha256 "6efcf1935a35466d23f69d8c7842bf0a7fb42d40d839e6a03e08ea2823bc1aaf"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.259/darwin/x86_64/nebius", using: :nounzip
      sha256 "5ae3ef140d74da5863589b215092bfb28e3b6a6903dbd4a41e8512e5b22cb1fa"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.259/linux/arm64/nebius", using: :nounzip
      sha256 "03b3206fedda64edd4c5e6ed0c13ba16c356b9141e74ca8d236f6b24427b4c48"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.259/linux/x86_64/nebius", using: :nounzip
      sha256 "4869a685d54d5aa50be23b817d1f20c43cf0c7efec6ce6e4862c2426b8764d9f"
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
