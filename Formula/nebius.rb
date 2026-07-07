class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.241/darwin/arm64/nebius", using: :nounzip
      sha256 "196794459c5e8ed2878f96a9b7b1e1f8d325dbf3618b3968f18a26bc160ab79b"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.241/darwin/x86_64/nebius", using: :nounzip
      sha256 "f80d58e9c52ccb21e6da5d75f2f40e72360671909c4a95cbf3a06390bf5bf03c"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.241/linux/arm64/nebius", using: :nounzip
      sha256 "f3e07973d9c5c17cfc2e40b6a7a9a07ad022b298a07c03e516448984d1786db7"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.241/linux/x86_64/nebius", using: :nounzip
      sha256 "87c56810178924edca492877ff5cc963e805cb7795aee30912a0d30a686d422a"
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
