class Gitgulf < Formula
  desc "Manage multiple git repositories from a single directory"
  homepage "https://github.com/tychop/GitGulf"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/tychop/GitGulf/releases/download/v#{version}/gitgulf-macos-arm64"
      sha256 "a128d44bd4db4ac695becc027548952e2542340c2ff42c1729615835f9c1ce9d"
    end
  end

  def install
    bin.install "gitgulf-macos-arm64" => "gitgulf"
  end

  test do
    system "#{bin}/gitgulf", "--version"
  end
end
