class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.254/darwin/arm64/nebius", using: :nounzip
      sha256 "c824f596e4e3de4e48360a054cedbb74989df886ba42f70637ae7a01cda4a709"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.254/darwin/x86_64/nebius", using: :nounzip
      sha256 "6f7b923a42d9a49fa7a8a2de571c35614317bb264a685e844e2c8bf42d916ffc"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.254/linux/arm64/nebius", using: :nounzip
      sha256 "d057c1f12e4a56daa67c0e3a996d77cbe2c8ab1f3b203ac6df717586595814fd"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.254/linux/x86_64/nebius", using: :nounzip
      sha256 "928c943ae517123e284a39a3695589c7621b2fd032cdbeb2e3169a9eb22cda5c"
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
