# Copyright 2019 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class UnusedDeps < Formula
  desc "Determine unused dependencies in Bazel java_library rules"
  homepage "https://github.com/bazelbuild/buildtools/"
  url "https://github.com/bazelbuild/buildtools/releases/download/0.25.1/unused_deps.mac"
  version "0.25.1"
  sha256 "db6fbcd44bd728d58c52dddb065ffd9ae7a880c9939f88da3ddef8dc56c8f8e1"

  bottle :unneeded

  depends_on "bazelbuild/tap/bazel" => :test

  def install
    bin.install "unused_deps.mac" => "unused_deps"
  end

  test do
    (testpath/"WORKSPACE").write <<~EOS
      workspace(name = "unused_deps_test")
    EOS
    (testpath/"BUILD").write <<~EOS
      java_library(
        name = "hello",
        srcs = ["Hello.java"],
      )
      java_library(
        name = "world",
        srcs = ["World.java"],
        deps = [":hello"],
      )
    EOS
    (testpath/"Hello.java").write <<~EOS
      public class Hello {}
    EOS
    (testpath/"World.java").write <<~EOS
      public class World {}
    EOS
    assert_match "buildozer 'remove deps :hello' //:world",
      shell_output(bin/"unused_deps //:world")
    system "bazel", "shutdown"
  end
end
