class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.244/darwin/arm64/nebius", using: :nounzip
      sha256 "4b326666d76ea567aef913a5bb98a7f0996d134001bed7c757f76a553437f9bc"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.244/darwin/x86_64/nebius", using: :nounzip
      sha256 "c9db023bd7875b52acff1cd7fcb0e4a348c9eb73a61a12f0d534ef5764bad29b"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.244/linux/arm64/nebius", using: :nounzip
      sha256 "17d2a76eea6ddda304eca8a65ab575af3cab9a60ca100024efe2f7ce5a523b45"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.244/linux/x86_64/nebius", using: :nounzip
      sha256 "7b66461abbf9153473a726ecf9d2ea6eaf2105fef7604b4cabb2399676b80d9a"
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
