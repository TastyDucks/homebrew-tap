class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.249/darwin/arm64/nebius", using: :nounzip
      sha256 "a1362ab5c40a52eb2368522ecdf35a50c7a453d3ba204585cccbca4f09fd1598"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.249/darwin/x86_64/nebius", using: :nounzip
      sha256 "b5e47c659e2a6bc36e52c953703e0663de262b75aed9aff1a5063e901fbe3358"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.249/linux/arm64/nebius", using: :nounzip
      sha256 "d9efe6526176b9fd8b27f37c1e10a95f22b00d342669946c3fafd502cced9fb4"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.249/linux/x86_64/nebius", using: :nounzip
      sha256 "d3e7799030d0b2970ae7c49ce8b4c86a1a92f5901e03facf4aef432059ae67fe"
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
