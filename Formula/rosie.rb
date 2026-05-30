class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/withastro/rosie/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "a075c8029cdd18907fe3e8d9369836fc99dbea53d93045d8a21b83bb487324b5"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/rosie --version").strip
  end
end
