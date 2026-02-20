class Dotf < Formula
  desc "Modular dotfile manager using git bare repo with sparse checkout"
  homepage "https://github.com/abjoru/dotf-v3"
  version "3.0.0"
  url "https://github.com/abjoru/dotf-v3/releases/download/v#{version}/dotf-v#{version}-macos-arm64"
  sha256 "3ee282938b9db6d7404509cc94cd17982bc136e170214db114966be2d998b38e"
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
