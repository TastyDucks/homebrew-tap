class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.243/darwin/arm64/nebius", using: :nounzip
      sha256 "9856bec5b7c8a17f882f4423486daef37ac7f470998707f99e551920707b078c"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.243/darwin/x86_64/nebius", using: :nounzip
      sha256 "52e79df8d0ac6551213bb4ed794e9ed6cf41cb5c234e6d83f8cc7f59c0c33dd3"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.243/linux/arm64/nebius", using: :nounzip
      sha256 "3f69cd80eab8cc3fc24c8482f80ec1847989a6862445dfb383f928aa104db8a9"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.243/linux/x86_64/nebius", using: :nounzip
      sha256 "771fe9c9cf5220d3983c445cfdc15667b0d8e8082967c80845c001234dd147bd"
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
