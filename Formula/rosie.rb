class Rosie < Formula
  desc "A robot helper for agent skills"
  homepage "https://github.com/matthewp/rosie"
  url "https://github.com/matthewp/rosie/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
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
