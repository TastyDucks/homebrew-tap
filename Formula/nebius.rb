class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.271/darwin/arm64/nebius", using: :nounzip
      sha256 "f3f014faba00a1d6d632f9a2d81c7b1a9fd97422f381781a66b06bb7bc2a0f43"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.271/darwin/x86_64/nebius", using: :nounzip
      sha256 "258a25b627b33f0ef7793d5964a77e3fc3f11714d637be78298cf0b0f4d61557"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.271/linux/arm64/nebius", using: :nounzip
      sha256 "a6607e515a407c61e1b6703a5368179aee6cefc9470fd2adeca44b2ecf322a55"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.271/linux/x86_64/nebius", using: :nounzip
      sha256 "1a16ec76c3eaff7c64547307b14a8c966643db643d0578a107afe32d18dd0578"
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
