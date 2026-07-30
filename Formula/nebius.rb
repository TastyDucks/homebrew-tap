class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.252/darwin/arm64/nebius", using: :nounzip
      sha256 "7670e3f6956d0b9e38675ef829ad6b5e7d69ab84822025470af078184a5adaa4"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.252/darwin/x86_64/nebius", using: :nounzip
      sha256 "e8d3f047d8e42fe5cb0b40b8b772143ca16c3bfc8055e261db78d8477afa69ec"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.252/linux/arm64/nebius", using: :nounzip
      sha256 "cf4998ed74bd6d09d558c8a87f476343f366c7ddcf909e27947f23f9534ad843"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.252/linux/x86_64/nebius", using: :nounzip
      sha256 "d824880715157f0311f83643c105879d56d9aa065babbf3e36101681560fae25"
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
