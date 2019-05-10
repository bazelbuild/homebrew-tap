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

class Ibazel < Formula
  desc "Tool for building Bazel targets when source files change"
  homepage "https://github.com/bazelbuild/bazel-watcher"
  url "https://github.com/bazelbuild/bazel-watcher/releases/download/v0.10.2/ibazel_darwin_amd64"
  version "0.10.2"

  # To generate run:
  # curl -L -N -s https://github.com/bazelbuild/bazel-watcher/releases/download/v0.10.2/ibazel_darwin_amd64 | shasum -a 256
  # on macOS
  sha256 "f8df6cb8c5068aaec65b0428fec81504fae21424c8956bc57dab812547ba5e57"

  bottle :unneeded

  def install
    bin.install "ibazel_darwin_amd64" => "ibazel"
  end

  test do
    # Since ibazel loops in most cases the quickest check of validity
    # I can think of is to get the version output which happens when
    # invoked without any arguments.
    system bin/"ibazel"
  end
end
