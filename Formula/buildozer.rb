class Buildozer < Formula
  desc "A Bazel tool for changing multiple BUILD files"
  homepage "https://github.com/bazelbuild/buildtools"
  url "https://github.com/bazelbuild/buildtools/releases/download/1.0.0/buildozer.mac"

  # To generate run:
  # curl -LNf "https://github.com/bazelbuild/buildtools/releases/download/1.0.0/buildozer.mac" | shasum -a 256
  # on macOS
  sha256 "e00f8cc4af7b0c989d9bf7f89e81e5a060a524350d0a77e5f40d90119382a841"

  bottle :unneeded

  def install
    bin.install "buildozer.mac" => "buildozer"
  end

  test do
    build_file = testpath/"BUILD"

    touch build_file
    system "#{bin}/buildozer", "new java_library brewed", "//:__pkg__"

    assert_equal "java_library(name = \"brewed\")\n", build_file.read
  end
end
