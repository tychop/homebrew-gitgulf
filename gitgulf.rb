
class Gitgulf < Formula
  desc "GitGulf CLI tool"
  homepage "https://github.com/tychop/gitgulf"  # Update this to your repository
  url "https://github.com/tychop/GitGulf/archive/refs/tags/v0.1.0.tar.gz"  # Update this to your tarball URL
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  # Dependencies, if any
  depends_on :xcode => ["15.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/gitgulf"

    # Alias installations
    (bin/"ggs").write <<~EOS
      #!/bin/bash
      exec "#{bin}/gitgulf" status "$@"
    EOS
    (bin/"ggf").write <<~EOS
      #!/bin/bash
      exec "#{bin}/gitgulf" fetch "$@"
    EOS
    (bin/"ggp").write <<~EOS
      #!/bin/bash
      exec "#{bin}/gitgulf" pull "$@"
    EOS
    (bin/"ggd").write <<~EOS
      #!/bin/bash
      exec "#{bin}/gitgulf" development "$@"
    EOS
    (bin/"ggm").write <<~EOS
      #!/bin/bash
      exec "#{bin}/gitgulf" master "$@"
    EOS
    (bin/"ggb").write <<~EOS
      #!/bin/bash
      exec "#{bin}/gitgulf" -b "$@"
    EOS

    # Make the scripts executable
    bin.install_symlink bin/"ggs"
    bin.install_symlink bin/"ggf"
    bin.install_symlink bin/"ggp"
    bin.install_symlink bin/"ggd"
    bin.install_symlink bin/"ggm"
    bin.install_symlink bin/"ggb"
  end

  test do
    system "#{bin}/gitgulf", "--version"  # Update based on a reasonable test for your CLI
  end
end
