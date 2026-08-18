class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.262/darwin/arm64/nebius", using: :nounzip
      sha256 "46dffd79888c262ab3c17442ea00ae9a61bed46174897adeeb832b0a76037fc9"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.262/darwin/x86_64/nebius", using: :nounzip
      sha256 "707fd11c97c55542186f51db2bed35b4f4590d2da65009eb298990afe4f8bafe"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.262/linux/arm64/nebius", using: :nounzip
      sha256 "7d916a69688d0dc897229aeaf769ce87a67a8634fc59bf48bc0a18c6f7ee0bb4"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.262/linux/x86_64/nebius", using: :nounzip
      sha256 "39ef036d122646cfd9b537ccc32fdfcf14508ce45b661fdfdd3b8d001a8d53f8"
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
