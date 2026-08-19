class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.263/darwin/arm64/nebius", using: :nounzip
      sha256 "e0598cf3cab12cabbada357c75adf5d5a5c842a982006212311043873c067476"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.263/darwin/x86_64/nebius", using: :nounzip
      sha256 "099b96289cff95feac6740506fa459f2779dc180f8c6d89b7ac031855ceca4bb"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.263/linux/arm64/nebius", using: :nounzip
      sha256 "5d850f9f6b2f6a6db28c201aa9229bb19fb5ebedf4d671ab85573808f80c4723"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.263/linux/x86_64/nebius", using: :nounzip
      sha256 "8712903f152120e40ec64e96d242e754496e46dffde3b491a8f1a0d4cf67896d"
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
