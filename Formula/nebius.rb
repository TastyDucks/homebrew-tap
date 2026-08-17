class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.261/darwin/arm64/nebius", using: :nounzip
      sha256 "46d53be486dff1d0f49937e6252dcddddbc3cf2d458bff6c7a1b0072adde8b57"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.261/darwin/x86_64/nebius", using: :nounzip
      sha256 "73e2b7e6cc94aa1fd7307ed012b87b704714febfd411ad4ef9f62798bf335cbe"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.261/linux/arm64/nebius", using: :nounzip
      sha256 "228ed90045200a9196d4c317e311f22602b44831ac8c734f494b69518bd314a0"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.261/linux/x86_64/nebius", using: :nounzip
      sha256 "777f80b39ab42f6a70e865e40908e9325a282a26badf8f152bc5e22d73299c39"
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
