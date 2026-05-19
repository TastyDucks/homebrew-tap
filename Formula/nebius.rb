class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.214/darwin/arm64/nebius", using: :nounzip
      sha256 "a92c61df56f452d2978b441d5b87adb7163e057c77aa292208267af7fdb70506"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.214/darwin/x86_64/nebius", using: :nounzip
      sha256 "c48a8c11bee0109b47fa81edb5a4619be1d56f86155ec9336c8f0725a98d6f2a"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.214/linux/arm64/nebius", using: :nounzip
      sha256 "2c1eda3567152cef291e2ab9dc5987f37784deb163f3fdd5f615e33064a703d3"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.214/linux/x86_64/nebius", using: :nounzip
      sha256 "c3634c30c3ed39a08a9ff6d4a66a29fad61580049c4f5d7ea569e158219547dd"
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
