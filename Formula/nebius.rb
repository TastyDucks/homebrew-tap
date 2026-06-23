class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.233/darwin/arm64/nebius", using: :nounzip
      sha256 "77cbf56a82729352c0d7492edf4eb6b209923c11ed51dce8946fb1d0f6489103"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.233/darwin/x86_64/nebius", using: :nounzip
      sha256 "24ecf5e1682f921fc9e1ef2679af0067a4612337605eb07ccd537502912d65d4"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.233/linux/arm64/nebius", using: :nounzip
      sha256 "06328ed135b9f7906f171f501aa474c0d8a849eccd5c11c04b3709e5b744e881"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.233/linux/x86_64/nebius", using: :nounzip
      sha256 "afa36c295ac182e096414072a434b5fdbb0909ae1f5fda0b371ddfea0139c1f1"
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
