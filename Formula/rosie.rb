class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/matthewp/rosie/archive/refs/tags/v0.7.5.tar.gz"
  sha256 "1b68dbbdaa29c8118f5b98ce82f134e9413df7640b275af4af841ede8d2391d5"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/rosie --version").strip
  end
end
