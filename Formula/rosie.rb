class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/withastro/rosie/archive/refs/tags/v0.8.4.tar.gz"
  sha256 "2ea67cc151455b5b77b92eafa3f7e19db362b8bb2538172770c5945820992abd"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/rosie --version").strip
  end
end
