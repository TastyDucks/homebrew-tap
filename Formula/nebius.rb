class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.224/darwin/arm64/nebius", using: :nounzip
      sha256 "bc04456c90cb13cefbfb7755c64580bd2f11665e1a5c8208ffe8f9ce3484d04d"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.224/darwin/x86_64/nebius", using: :nounzip
      sha256 "d1e015115279715158ac93e28025afe2f1f0af53eb20b957905a2e3e95394c1a"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.224/linux/arm64/nebius", using: :nounzip
      sha256 "205bda91e099381d5503de7c1b726e14178586431d549f9ac1f18239853085c3"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.224/linux/x86_64/nebius", using: :nounzip
      sha256 "8bed215f1e2e37b25834213811ce67c8361ae6d308c8dc19a1c8bd2ef1d6cb90"
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
