class Gitgulf < Formula
  desc "Manage multiple git repositories from a single directory"
  homepage "https://github.com/tychop/GitGulf"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/tychop/GitGulf/releases/download/v#{version}/gitgulf-macos-arm64"
      sha256 "1638c67108075201561613edad730ff26ccec0aeb08ca42948bd8fc705ab00ce"
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
    
    (bin/"ggd").chmod 0755
    (bin/"ggm").chmod 0755
    (bin/"ggb").chmod 0755
  end

  test do
    system "#{bin}/gitgulf", "--version"
  end
end
