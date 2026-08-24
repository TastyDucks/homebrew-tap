class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.264/darwin/arm64/nebius", using: :nounzip
      sha256 "3f2725799e75354d69b8bb2491f18815dfeafc9ab7bd2a574f6634bcd6b8f538"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.264/darwin/x86_64/nebius", using: :nounzip
      sha256 "a67e5fbb13b38cdc2cf77f61922c9618a64fb69ef6027619dbf9ec4353dd7dfc"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.264/linux/arm64/nebius", using: :nounzip
      sha256 "cdd85a8f0a3611f710a82e1605501b4c4a48ea46e7e0a77c7afd57ebf1c73131"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.264/linux/x86_64/nebius", using: :nounzip
      sha256 "f0b3859f63806fc4eaf9d67a180f81b2ce43983d24b52e06015329ad5a719ad1"
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
