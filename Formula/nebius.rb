class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.219/darwin/arm64/nebius", using: :nounzip
      sha256 "1b7e5afa26e7a5cb1f2c5d8c5cfc0cb2aab4415e8b850dde19cba47dfe4cac82"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.219/darwin/x86_64/nebius", using: :nounzip
      sha256 "1458ebb95e4838bbd25a9256e1d1fd614ca1080db41e685d20b8661783d7969f"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.219/linux/arm64/nebius", using: :nounzip
      sha256 "dbeeb028ccd1f9af61a6eba2cfe0699305476ced46b73074cd6472bc6df5a8ad"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.219/linux/x86_64/nebius", using: :nounzip
      sha256 "ef23c162e42d3158c10cecec99113f4e60fc2cf2298c88cabeca224ef57341b2"
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
