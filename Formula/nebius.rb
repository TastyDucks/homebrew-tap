class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.235/darwin/arm64/nebius", using: :nounzip
      sha256 "279dbc8d069da4a678fdf9898caf27668bae7c7bbdc1b7fc979ae6be690f3626"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.235/darwin/x86_64/nebius", using: :nounzip
      sha256 "bb75e08ed9cb5dfc58ff9de335cefa44fa7a3c8db8e68e9d30cbcad00e8adaa0"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.235/linux/arm64/nebius", using: :nounzip
      sha256 "4a59348fcf5337c39893331f62c5a349080058bab7c8e046147a994753513366"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.235/linux/x86_64/nebius", using: :nounzip
      sha256 "c6e30e90627ddc793a3899ed3c8612afac4bc6edfae41148ff2d0d2aac15cf75"
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
