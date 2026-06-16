class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.229/darwin/arm64/nebius", using: :nounzip
      sha256 "1b51e25abee9798ef693cb70ef5b1f7389bbbf72ed3a19944f31fa48e586f3ad"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.229/darwin/x86_64/nebius", using: :nounzip
      sha256 "fc77fb1a61fd33911e7b2b73cd2b1f648bd2601ee03feff63f1cb9fca5bff630"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.229/linux/arm64/nebius", using: :nounzip
      sha256 "78a614d6e9b2d3a9a7a05a73f111d9a24b820fb9ad10beb30549103c0a981210"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.229/linux/x86_64/nebius", using: :nounzip
      sha256 "770a828892eb356008b19e90d1b2b2aa34489ecfd11818ec6afee9e8fdf21984"
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
