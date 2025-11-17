class Gitgulf < Formula
  desc "GitGulf CLI tool"
  homepage "https://github.com/tychop/gitgulf"
  url "https://github.com/tychop/GitGulf/releases/download/v0.2.1/gitgulf-0.2.1-macos-arm64.tar.gz"
  sha256 "bd157113a32b847f92c3c9540ea6f3d9edeac19f24c005e79fb3a038b944a1c0"
  version "0.2.1"
  license "MIT"

  def install
    bin.install "gitgulf"

    # Alias installations
    (bin/"ggs").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" status "$@"
    EOS
    (bin/"ggf").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" fetch "$@"
    EOS
    (bin/"ggp").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" pull "$@"
    EOS
    (bin/"ggd").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" development "$@"
    EOS
    (bin/"ggm").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" master "$@"
    EOS
    (bin/"ggb").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" -b "$@"
    EOS

    # Make the scripts executable
    (bin/"ggs").chmod 0755
    (bin/"ggf").chmod 0755
    (bin/"ggp").chmod 0755
    (bin/"ggd").chmod 0755
    (bin/"ggm").chmod 0755
    (bin/"ggb").chmod 0755
  end

  test do
    system "#{bin}/gitgulf", "--version"  # Update based on a reasonable test for your CLI
  end
end
