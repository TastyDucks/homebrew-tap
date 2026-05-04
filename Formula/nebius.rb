class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.210/darwin/arm64/nebius", using: :nounzip
      sha256 "f36a4c0cb33917b197733a7ad6c6508efad204f0d6863e80a4b8ce87173f7227"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.210/darwin/x86_64/nebius", using: :nounzip
      sha256 "ffdc6b2107cf12c0fcc1e4a497692f6df589b1e55612f81161344131e34328eb"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.210/linux/arm64/nebius", using: :nounzip
      sha256 "3a87713ed0ba465d087786a10252c2b4e833e34223f1586f604266e64da6999f"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.210/linux/x86_64/nebius", using: :nounzip
      sha256 "091ce6820f49b94c530961f6dfeada2b6871d8e7aedebbfadae5052fe847d797"
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
