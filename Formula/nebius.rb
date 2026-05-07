class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.211/darwin/arm64/nebius", using: :nounzip
      sha256 "5dd942ccab95eb5b40bffb8c99f2d06b9de4859eaf93865d3dbb89c9a88968ba"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.211/darwin/x86_64/nebius", using: :nounzip
      sha256 "ceaa5ba6f232ebd44f3c6cfd3df8104f50a12e41ce6cce29e723079e147df81e"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.211/linux/arm64/nebius", using: :nounzip
      sha256 "9d5a8749037da0df569e6011948565baa9265039e1421624b3566f763412947f"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.211/linux/x86_64/nebius", using: :nounzip
      sha256 "cf7619e735da1e5b13abf64df358793e306ee096278ea7443f873f492dbe6b5e"
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
