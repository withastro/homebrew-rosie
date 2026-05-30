class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/withastro/rosie/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "f7dbae8451b12542abf84de2689311f471427f96f5dd77b3e4186de9fb9cc834"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/rosie --version").strip
  end
end
