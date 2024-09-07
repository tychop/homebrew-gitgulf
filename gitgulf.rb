class Gitgulf < Formula
  desc "GitGulf CLI tool"
  homepage "https://github.com/tychop/gitgulf"
  url "https://github.com/tychop/GitGulf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f2410e9f0bf80e8c436b24c58a2c4db82482b94d3c58024159f9f8b6998136fc"
  license "MIT"

  depends_on :xcode => ["15.0", :build]
  depends_on "swift"

  def install
    ENV.deparallelize  # Ensure build is done in a writable directory
    system "swift", "build", "-c", "release", "--disable-sandbox"  # Disable sandbox to avoid issues

    bin.install ".build/release/gitgulf"

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
