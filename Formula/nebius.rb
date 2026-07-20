class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.246/darwin/arm64/nebius", using: :nounzip
      sha256 "1df47f592829ae8810a95afda2e6e578f6667ae3399b93efc2b26590fded438e"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.246/darwin/x86_64/nebius", using: :nounzip
      sha256 "c57d3c75b61bf5b2bc644518a2acea8cba5e3fa191d47d6eaf68717193eb586c"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.246/linux/arm64/nebius", using: :nounzip
      sha256 "854dbabb8eaae92d9277a082f3e20bf69bcb65e0caa67d42b19fb62c26515067"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.246/linux/x86_64/nebius", using: :nounzip
      sha256 "3490945b2544c193e501a6ffe21619f585330699d53742bbf723d346bee565dd"
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
