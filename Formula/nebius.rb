class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.255/darwin/arm64/nebius", using: :nounzip
      sha256 "36cb44615478bba1df4bbc46535261c226a68e516883493a7f8ded5a0061979b"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.255/darwin/x86_64/nebius", using: :nounzip
      sha256 "bdf07d74a9994902129f33259733ff2659681d878765c902ab19e7763df36414"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.255/linux/arm64/nebius", using: :nounzip
      sha256 "59f43a3caa5fd0d5ccd68f5cf99615043a0910c2658b53e92f7adba02cee0c38"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.255/linux/x86_64/nebius", using: :nounzip
      sha256 "4de19db61056aa18a94a5862b24c25443c08e60ffb3b1aa7c8d6e2079b315831"
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
