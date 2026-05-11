class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.212/darwin/arm64/nebius", using: :nounzip
      sha256 "d4cd219d7b3e7718ec7126a0650173b590b99db850e646c3a28f9775f509d09b"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.212/darwin/x86_64/nebius", using: :nounzip
      sha256 "6297d639dddb9659bce6e57af65e7ee7bd2a27f95e05abc643b7bc002cddd663"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.212/linux/arm64/nebius", using: :nounzip
      sha256 "abe3ac0c229ea4d81a5840cf3de57419eb19cb5135df0621ff64894513cf4784"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.212/linux/x86_64/nebius", using: :nounzip
      sha256 "5cb27a031ea2d0b91bf6c5b9aa66bfa4d93cf7b94921f96fa7385b3ce57eeeed"
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
