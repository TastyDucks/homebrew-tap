class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.253/darwin/arm64/nebius", using: :nounzip
      sha256 "aeefe1aa08d29f67608d28d1c1d483936803bcbfc8d1ee39b647a753686dd2ef"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.253/darwin/x86_64/nebius", using: :nounzip
      sha256 "85ccb4270d9dd8ce076cecbcd5a94f0d3811c0524e26ea4703644b6aabc31260"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.253/linux/arm64/nebius", using: :nounzip
      sha256 "8dbfbe702dae5709522d8619c84d10bffc5094718b6e7609791526848334c3c5"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.253/linux/x86_64/nebius", using: :nounzip
      sha256 "e4a61464423ace53e9cc298bdd48ddf9a909e40e1c268720dd1b27d06085e589"
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
