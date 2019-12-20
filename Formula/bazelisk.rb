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

class Bazelisk < Formula
  desc "User-friendly launcher for Bazel"
  homepage "https://github.com/bazelbuild/bazelisk"
  url "https://github.com/bazelbuild/bazelisk/releases/download/v1.2.0/bazelisk-darwin-amd64"
  version "1.2.0"

  # To generate run:
  # curl -L -N -s https://github.com/bazelbuild/bazelisk/releases/download/v1.2.0/bazelisk-darwin-amd64 | shasum -a 256
  # on macOS
  sha256 "6bfca2304cc2258578658d95a6e8dbe43d3ae5dd089076128c726cf14b8c2b8f"

  bottle :unneeded

  conflicts_with "bazelbuild/tap/bazel", :because => "Bazelisk replaces the bazel binary"

  def install
    bin.install "bazelisk-darwin-amd64" => "bazelisk"
    bin.install_symlink "bazelisk" => "bazel"
  end

  test do
    # Simply run bazelisk to see whether it finished. Use a hardcoded version
    # number to avoid calling the GitHub API.
    touch testpath/"WORKSPACE"
    (testpath/".bazelversion").write "0.28.1"
    system bin/"bazel", "version"
    system bin/"bazelisk", "version"
  end
end
