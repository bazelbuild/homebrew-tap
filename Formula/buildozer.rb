class Buildozer < Formula
  desc "A Bazel tool for changing multiple BUILD files"
  homepage "https://github.com/bazelbuild/buildtools"
  url "https://github.com/bazelbuild/buildtools/archive/0.29.0.tar.gz"
  sha256 "f3ef44916e6be705ae862c0520bac6834dd2ff1d4ac7e5abc61fe9f12ce7a865"

  depends_on "bazelisk" => :build

  def install
    system "bazelisk", "build", "//buildozer:buildozer"

    bin.install "bazel-bin/buildozer/darwin_amd64_stripped/buildozer"
  end

  test do
    file_path = testpath/"BUILD"

    touch file_path
    system "#{bin}/buildozer", "new java_library brewed", "//:__pkg__"

    assert_equal "java_library(name = \"brewed\")\n", file_path.read
  end
end
