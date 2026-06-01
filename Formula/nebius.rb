class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.220/darwin/arm64/nebius", using: :nounzip
      sha256 "cb86e04285647e9627c3754a0502e5bfa900d010675565f203b7fe64c019cbee"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.220/darwin/x86_64/nebius", using: :nounzip
      sha256 "4bfde370f1f41955141ab8ce56401b8d1be1cd426ec522f5feb12497fea5a1ab"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.220/linux/arm64/nebius", using: :nounzip
      sha256 "7deab84a510db692ada07b1c29fd32649e0343643b4bd11ab4f11d7f7b6fca56"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.220/linux/x86_64/nebius", using: :nounzip
      sha256 "a475de7c3eefd30de0b79df76703004a6b04ef59dc07d9649d00565d35d81dc2"
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
