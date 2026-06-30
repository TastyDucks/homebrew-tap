class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.237/darwin/arm64/nebius", using: :nounzip
      sha256 "de7cac3f026a7aa0d03ae2b34748ccd611e283bdaf48790dc4c028496bd8ea46"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.237/darwin/x86_64/nebius", using: :nounzip
      sha256 "e16b476fd343ec90696fdd4b024d8476f3b20c7c323ed3e16d721202a00e2c62"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.237/linux/arm64/nebius", using: :nounzip
      sha256 "2b9b8c5a5c2468687ba24741e39a9fb86007d84444d413fc47eb4f49cddaee1a"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.237/linux/x86_64/nebius", using: :nounzip
      sha256 "21ec0bce819badd025c37dd9666ccdb16b8dfd8c74643eef3af7c9212ed3e919"
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
