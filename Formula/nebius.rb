class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.234/darwin/arm64/nebius", using: :nounzip
      sha256 "dfabc25e8a6e2bc0aee8f31fd7641090d06edaec55ce5fb4bb88811ab4157ea2"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.234/darwin/x86_64/nebius", using: :nounzip
      sha256 "4dd55c9466728d042af18059f4365ff6f3215059dc41a9ce4c7e5df5bfc7c5b2"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.234/linux/arm64/nebius", using: :nounzip
      sha256 "4b8eaa1aff979cdb3d24eccedc08677a3b3fc406fe973af840300d7bcd066d2d"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.234/linux/x86_64/nebius", using: :nounzip
      sha256 "14d0d84677ac802408c707c177885941b133c1db32ada8ad0e9932a5aff154df"
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
