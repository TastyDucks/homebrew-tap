cask "hidapitester" do
  version "v0.5"
  sha256 "80a6b76862eccf80447e92b9b28b2537e70ba72d7fc8d98362997cf50ff7e70d"

  url "https://github.com/todbot/hidapitester/releases/download/#{version}/hidapitester-macos-arm64.zip"
  name "hidapitester"
  desc "Simple command-line program to test HIDAPI"
  homepage "https://github.com/todbot/hidapitester"

  binary "hidapitester"

  postflight do
    # macOS quarantines unknown apps; undo that to allow the app to open without further modification.
    system_command 'xattr',
                    args: [
                      '-r',
                      '-d', 'com.apple.quarantine',
                      "#{staged_path}/hidapitester"
                    ]
  end
end
