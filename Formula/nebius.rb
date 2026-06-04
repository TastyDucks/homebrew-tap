class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.223/darwin/arm64/nebius", using: :nounzip
      sha256 "4666415ff1526e9b0627af8040e8c669eccfc385f7abdcb77d5b023f7c2cb581"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.223/darwin/x86_64/nebius", using: :nounzip
      sha256 "0691f91c401ea6161f32572a69d1aa90b15f87480fa11f92ea425a29d28ccc35"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.223/linux/arm64/nebius", using: :nounzip
      sha256 "0b807aa2df2ab2c1124b7b60f683c87757468c2a079b2c71bdbec7ba66f40e79"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.223/linux/x86_64/nebius", using: :nounzip
      sha256 "c2e7e15bde993cdf50f686a00742644ced6b8dccc5601ddd2a6b4f03380507bd"
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
