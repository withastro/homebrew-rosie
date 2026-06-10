class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/withastro/rosie/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "908cb6c65fa0d2d7d88019ca934e6e93e26f165f0b892ae9e1dbbf4ae70bee6b"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/rosie --version").strip
  end
end
