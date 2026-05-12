class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/matthewp/rosie/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "6293c9e403b52abfa8a47eaa0563301a1857b9cad3899ee4a6f229f8838de98a"
  license "BSD-3-Clause"

  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "libarchive"

  def install
    # Set PKG_CONFIG_PATH for keg-only libarchive
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["libarchive"].opt_lib/"pkgconfig"

    system "make", "release"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "rosie #{version}", shell_output("#{bin}/rosie --version")
  end
end
