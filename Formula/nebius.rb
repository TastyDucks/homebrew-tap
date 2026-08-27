class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.267/darwin/arm64/nebius", using: :nounzip
      sha256 "ffcd3795d2df460b08f7e5bc93209b76ee072c689e6719eb7e0cdad9aa5d069d"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.267/darwin/x86_64/nebius", using: :nounzip
      sha256 "6d55d6cbb48588cc219f6d1bb2440642bccd33e1a2592554aad6495e901d52cf"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.267/linux/arm64/nebius", using: :nounzip
      sha256 "f6a2f26ba5d7ce93b5839daf96ce1f46d9c5da1e1e1d9050b4ada6d608151ac9"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.267/linux/x86_64/nebius", using: :nounzip
      sha256 "0657765ae0b0a3505774a5263b77d81a2aace905b0ffefcb9fb2ea5cc37739a1"
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
