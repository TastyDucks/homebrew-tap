class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.230/darwin/arm64/nebius", using: :nounzip
      sha256 "0a829aa58a1fa88562e33f84f2489de26bb88774f7664c89f47a5db2b4f7f7ca"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.230/darwin/x86_64/nebius", using: :nounzip
      sha256 "78a1af990b1e36a2a47708af50d0bed26da1d6584da99cce4b92f7a2ca62cd17"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.230/linux/arm64/nebius", using: :nounzip
      sha256 "5ac81f3062bb49f536f5c07ec500c50fd46b5139c8594c0e3ae3fbf20ec5e106"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.230/linux/x86_64/nebius", using: :nounzip
      sha256 "50a5fd2615bc4b1e13503c2add5702eb5879e13ac1ae844391af6c55f90cc846"
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
