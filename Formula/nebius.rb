class Nebius < Formula
  desc "Command-line interface for Nebius AI Cloud"
  homepage "https://docs.nebius.com/cli/quickstart"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.218/darwin/arm64/nebius", using: :nounzip
      sha256 "fa1a811fd4e0e571034500a0043241b8d6f081a3355c570969b420965b78f9ae"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.218/darwin/x86_64/nebius", using: :nounzip
      sha256 "66fbc3b603c52ee7989ac8852f3106430b92c49ff7e48f47803e2afd59c52a66"
    end
  end

  on_linux do
    on_arm do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.218/linux/arm64/nebius", using: :nounzip
      sha256 "9bdbfd9d52e5f459def77bf3a09d476f797439b4288f754f2077518acffda13d"
    end

    on_intel do
      url "https://storage.eu-north1.nebius.cloud/cli/release/0.12.218/linux/x86_64/nebius", using: :nounzip
      sha256 "2f359d67ecea15831758c19a8e5ca2fc2c21122c68cdfc764894d1bdf025d2a7"
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
