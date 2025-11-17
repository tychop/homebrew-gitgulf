class Gitgulf < Formula
  desc "GitGulf CLI tool"
  homepage "https://github.com/tychop/gitgulf"
  url "https://github.com/tychop/GitGulf/releases/download/v0.3.0/gitgulf-0.3.0-macos-arm64.tar.gz"
  sha256 "fc788881f11f68c5331c7d39d6cdb93e47007687123dbd6e9d38d2cde7367a00"
  version "0.3.0"
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
    (bin/"ggpr").write <<~EOS
      #!/bin/bash
      "#{bin}/gitgulf" rebase "$@"
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
    (bin/"ggpr").chmod 0755
    (bin/"ggd").chmod 0755
    (bin/"ggm").chmod 0755
    (bin/"ggb").chmod 0755
  end

  test do
    system "#{bin}/gitgulf", "--version"  # Update based on a reasonable test for your CLI
  end
end
