class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.248/darwin/arm64/nebius", using: :nounzip
      sha256 "2fd6215c6a37198322d1a23530be950a2f0bffe94a29a129cd86af6f1f7692f4"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.248/darwin/x86_64/nebius", using: :nounzip
      sha256 "56587c4323e09cb1d969ad88ec1ef3a019b20eee65ab63248308f6023c817a31"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.248/linux/arm64/nebius", using: :nounzip
      sha256 "2576ea96f81756b90a4380ebbd8832892d5e331be6acc417cfe02bfa77e49edc"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.248/linux/x86_64/nebius", using: :nounzip
      sha256 "48d18d59c414c73cae4d4c51f2cc5268a543b46a4bfd900977c50fd07a61b854"
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
