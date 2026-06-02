class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.221/darwin/arm64/nebius", using: :nounzip
      sha256 "45c9465f7b2fa5198425ac806703be0213d4d85f524d3a181e28c7692d916e6c"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.221/darwin/x86_64/nebius", using: :nounzip
      sha256 "cde895f78fb6e3fd7c2e7b47db3e7223aef2db4be03c1e243487f78667430778"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.221/linux/arm64/nebius", using: :nounzip
      sha256 "dc75bc141d6f4ccc4c9c9f6c7d684dfa5c1293545dabfcb8669c4e8172f04206"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.221/linux/x86_64/nebius", using: :nounzip
      sha256 "3dabb84c984db27ae312c00d7750fedaff982a31b59f86c37dde10ef371c9d83"
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
