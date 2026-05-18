class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/matthewp/rosie/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "a8354d12231ecf665d0d4189ba322f463ed0ce3de4f8f9431b44959da3b5d979"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/rosie --version").strip
  end
end
