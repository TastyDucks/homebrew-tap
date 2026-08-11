class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.258/darwin/arm64/nebius", using: :nounzip
      sha256 "a6c00e6710f85c1e9f3ba628850552d8cb00c217052e46aa09ba1e44b1624a21"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.258/darwin/x86_64/nebius", using: :nounzip
      sha256 "5c799fdb3cd333b47a5b51702ac5a9ecd3cbaf70b60e953c1618a37b4dd6615a"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.258/linux/arm64/nebius", using: :nounzip
      sha256 "9b68eacc6844d014266fda7d9bb8779e657f920eaabd9d5fcfb6ce5680401451"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.258/linux/x86_64/nebius", using: :nounzip
      sha256 "b6ba6f1a064426de5ab353ed64ebeba2525efbec818a9def1b4954b2a6429861"
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
