class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.266/darwin/arm64/nebius", using: :nounzip
      sha256 "3520073dac94c1043e56c5b98af52bfcade79dae8cb7e4f454e69c165937fcad"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.266/darwin/x86_64/nebius", using: :nounzip
      sha256 "9e67f421bc9e5debe6313aa6b4771c8910f7613e111601e3a5ee671bed5b1fa3"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.266/linux/arm64/nebius", using: :nounzip
      sha256 "bd02a410557a17f2db53fa6920497145eebec6295a9030178577e2f7e026a5d6"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.266/linux/x86_64/nebius", using: :nounzip
      sha256 "53bdb3266b16e9112b15fd5e606a3523fb0641a7c0e475b59801d440399d0566"
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
