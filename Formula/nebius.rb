class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.239/darwin/arm64/nebius", using: :nounzip
      sha256 "07af4339a0e6712c435609ac542f8eb23bd0bc175b7760f998b462ea8572910c"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.239/darwin/x86_64/nebius", using: :nounzip
      sha256 "b43f7f83a6f9c2010bd2acb98e1943b8d3b4dce0bf960a9e71e40ee8783a540a"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.239/linux/arm64/nebius", using: :nounzip
      sha256 "f58390b8ee51afed89b9b2057568cf94658d7e5fb316856611c9c7d09ff024f4"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.239/linux/x86_64/nebius", using: :nounzip
      sha256 "e2f23b1c2e92b6b0fd1ce3c1f9f8fb8501d9ba071e0e9006208e58624320f8ca"
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
