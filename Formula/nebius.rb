class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.247/darwin/arm64/nebius", using: :nounzip
      sha256 "8a8dc209b283bcaad9b9ffbfc019216b557cfa811dab7640ebd09a0624405856"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.247/darwin/x86_64/nebius", using: :nounzip
      sha256 "ef04b0d71c0e2b8b04d2a2ef7e5fdcc8ef3203cfb7b2a9983fda3f15147734f0"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.247/linux/arm64/nebius", using: :nounzip
      sha256 "225662b0d17cd9a8403965e433dc31b9f9407f5c92520570ea231f2b2a7a864e"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.247/linux/x86_64/nebius", using: :nounzip
      sha256 "dae13334871d80712e56d17b939e8d589399ed7b0fd4d4a7f4ca76eb591662c6"
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
