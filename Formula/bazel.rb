# Copyright 2018 The Bazel Authors. All rights reserved.
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

class Bazel < Formula
  desc "Fast, scalable, multi-language and extensible build system"
  homepage "https://bazel.build/"
  url "https://releases.bazel.build/1.0.0/release/bazel-1.0.0-installer-darwin-x86_64.sh", :using => :nounzip
  version "1.0.0"
  sha256 "fdab79e3a89e979b63487fd268761aac17a6ca4c8a41830743978c46d2160ff9"

  bottle :unneeded

  def install
    chmod 0555, "bazel-#{version}-installer-darwin-x86_64.sh"
    system "./bazel-#{version}-installer-darwin-x86_64.sh", "--prefix=#{buildpath}"
    bin.install "lib/bazel/bin/bazel" => "bazel"
    bin.install "lib/bazel/bin/bazel-real" => "bazel-real"
    bash_completion.install "lib/bazel/bin/bazel-complete.bash"
    zsh_completion.install "lib/bazel/bin/_bazel"
  end

  test do
    touch testpath/"WORKSPACE"
    (testpath/"Main.java").write <<~EOS
      public class Main {
        public static void main(String... args) {
          System.out.println("Hello world!");
        }
      }
    EOS
    (testpath/"BUILD").write <<~EOS
      java_binary(
        name = "main",
        srcs = ["Main.java"],
        main_class = "Main",
      )
    EOS
    system bin/"bazel", "build", "//:main"
    system "bazel-bin/main"
  end
end
