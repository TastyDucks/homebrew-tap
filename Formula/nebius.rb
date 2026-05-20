class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.215/darwin/arm64/nebius", using: :nounzip
      sha256 "2b844b1c9cfe48b30ccf0453e26af8ef4f17b98cb90d119a446b67125e13adb0"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.215/darwin/x86_64/nebius", using: :nounzip
      sha256 "ee97f066ddf7b22ffef59d0a785b4b9034ed9cc44b62548d8bcb3956fe894aea"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.215/linux/arm64/nebius", using: :nounzip
      sha256 "13429b31b0b557c6334816532f38b5ac0a9b5386d25b50a9ad81fef80bb463c1"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.215/linux/x86_64/nebius", using: :nounzip
      sha256 "75cc62f15a66bc27f28decd3484d55ed50c805d729f11f5fb707b92749560c32"
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
