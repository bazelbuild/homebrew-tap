class Buildozer < Formula
  desc "A Bazel tool for changing multiple BUILD files"
  homepage "https://github.com/bazelbuild/buildtools"
  url "https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildozer.mac"
  # curl --location "URL" | shasum --algorithm 256
  sha256 "316d24478f3be8a076b7901810dbfff79e305b3ac73a93b56f30a92950e5d0d0"

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
