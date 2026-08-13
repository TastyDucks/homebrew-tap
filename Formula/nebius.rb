class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.260/darwin/arm64/nebius", using: :nounzip
      sha256 "23e75979de84559e38620eb86523cc6048361fe907712d54d398f5ddcecc8aae"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.260/darwin/x86_64/nebius", using: :nounzip
      sha256 "3d922c2ac1f8d2a507bd4d533d54c8d9bc4bc4993339550fd189d2b9cead990f"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.260/linux/arm64/nebius", using: :nounzip
      sha256 "83c85673a8b2c2c2916491c7afebfe8b1f50fda661cbb483555368d855e17564"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.260/linux/x86_64/nebius", using: :nounzip
      sha256 "99a5771714c947bb6361a456d7ca1c87bab3b18e1dbc3ff40ebcc7ff951884cd"
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
