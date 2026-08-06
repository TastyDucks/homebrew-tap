class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.256/darwin/arm64/nebius", using: :nounzip
      sha256 "ed6a5a8e657ee6010a638df131ea15c0296ea7585dee4635ece9bfedaf0ef1e9"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.256/darwin/x86_64/nebius", using: :nounzip
      sha256 "63db466181deca4a88f8429c8244fb598bad23a56aaf30d526e7341d3f0d5cfd"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.256/linux/arm64/nebius", using: :nounzip
      sha256 "8d9b2916f87075f3eba13577e6bdccb216fb4a5596cebc3179cfc43c49343c3e"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.256/linux/x86_64/nebius", using: :nounzip
      sha256 "e53faf470872d599f352198b4dac64f95504fbbfe3bcaf48fdcf984b13ad7183"
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
