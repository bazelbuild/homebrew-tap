class Buildozer < Formula
  desc "A Bazel tool for changing multiple BUILD files"
  homepage "https://github.com/bazelbuild/buildtools"
  url "https://github.com/bazelbuild/buildtools/releases/download/3.0.0/buildozer.mac"

  # To generate run:
  # curl -LNf "https://github.com/bazelbuild/buildtools/releases/download/3.0.0/buildozer.mac" | shasum -a 256
  # on macOS
  sha256 "19702240b1a0e0f03167a5058e2e14cfb7c690f8b7a022dac6e191d6f135981e"

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
