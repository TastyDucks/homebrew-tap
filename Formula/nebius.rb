class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.268/darwin/arm64/nebius", using: :nounzip
      sha256 "48f0f93397c441a3755952f48a38a1b11b9e42c0f9d1fce4be4353c1c7a015f8"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.268/darwin/x86_64/nebius", using: :nounzip
      sha256 "55768a28fc0f7470f04d949f795ee8825e68fc67838fb96ca1f3b16a33140c64"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.268/linux/arm64/nebius", using: :nounzip
      sha256 "45687a21c37fd9478ff1163f1d98c087b53e8ec008fe6bbec43744041a38ceed"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.268/linux/x86_64/nebius", using: :nounzip
      sha256 "e7f02c0382ede2a33aacbcf8115e75efa0d43e05001d05d8ea44b7126993be3e"
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
