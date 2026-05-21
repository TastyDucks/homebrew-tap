class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.216/darwin/arm64/nebius", using: :nounzip
      sha256 "04e2c73d7d0afe2fa83ccf280f1cc0932378ebd8f2abeebb939365820fb78928"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.216/darwin/x86_64/nebius", using: :nounzip
      sha256 "fde87404385e35ecf924e57d6370ac651a6ff6589034ec3bac13bfed1af7ee00"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.216/linux/arm64/nebius", using: :nounzip
      sha256 "ced67dac1d32b8a9e0a589137a1b74e96710867d6ce48f501529862a0e640e77"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.216/linux/x86_64/nebius", using: :nounzip
      sha256 "fc9b5687162bcb248c509ac022c9e16995ae26f1983f743c1137eb33b5a09ab4"
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
