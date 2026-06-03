class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.222/darwin/arm64/nebius", using: :nounzip
      sha256 "ec9ecfba3d0842f407a8bcc341d97c8f82961a341f9a71c5e144a8e125bc529f"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.222/darwin/x86_64/nebius", using: :nounzip
      sha256 "9ce84b9b916bfafff00beb3bca6c81d877433758c86f1c41c5b3e6e1ba275b92"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.222/linux/arm64/nebius", using: :nounzip
      sha256 "aa359ff0943b3ffe34c720ce4b5ff2e1e5fc7c0fb2104b1d61f6cb22d474fdcb"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.222/linux/x86_64/nebius", using: :nounzip
      sha256 "9a9bb59efad11bbe9e74cb7a6e8ddfcb37240103c0330412246a0b60531d8110"
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
