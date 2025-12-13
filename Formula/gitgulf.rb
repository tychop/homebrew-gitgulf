class Gitgulf < Formula
  desc "Manage multiple git repositories from a single directory"
  homepage "https://github.com/tychop/GitGulf"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/tychop/GitGulf/releases/download/v#{version}/gitgulf-macos-arm64"
      sha256 "8602cb17541c6780326c0652acc66e33402e344d31957e7611b54a65395b80a9"
    end
  end

  def install
    bin.install "gitgulf-macos-arm64" => "gitgulf"

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
    system "#{bin}/gitgulf", "--version"
  end
end
