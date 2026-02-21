class Dotf < Formula
  desc "Modular dotfile manager using git bare repo with sparse checkout"
  homepage "https://github.com/abjoru/dotf-v3"
  version "3.0.2"
  url "https://github.com/abjoru/dotf-v3/releases/download/v#{version}/dotf-v#{version}-macos-arm64"
  sha256 "b72f0f3e355c54a01a9f5be1bdef8c9014e98b07890955f8a9ba9169da76376c"
  license "BSD-3-Clause"

  depends_on :macos
  depends_on "git"

  def install
    bin.install "dotf-v#{version}-macos-arm64" => "dotf"
  end

  test do
    system "#{bin}/dotf", "--help"
  end
end
