class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.242/darwin/arm64/nebius", using: :nounzip
      sha256 "b6f2310d9c9d1a9fe4b4026c55822e7ecf9371a4868ece3d64c5bf3908501931"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.242/darwin/x86_64/nebius", using: :nounzip
      sha256 "bce3cc2b382f680717ea89b35c6a5a3f3b30261f2e4746241589c7867f33704f"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.242/linux/arm64/nebius", using: :nounzip
      sha256 "a180a8406da07e3813daa925cc657553042a7b9e9d59c9d3ed6072f1775c832d"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.242/linux/x86_64/nebius", using: :nounzip
      sha256 "337c1158ff2f47bc94b567e132e28f8669e1e25137714bf93e2b87800e4c6a3e"
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
