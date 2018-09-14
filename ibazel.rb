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
  desc 'IBazel is a tool for building Bazel targets when source files change.'
  homepage 'https://github.com/bazelbuild/bazel-watcher'
  version '0.5.0'
  url "https://codeload.github.com/bazelbuild/bazel-watcher/tar.gz/v0.5.0"
  sha256 '6b727c60a807b56ebcf7b76c1002657bd93ad9199a2caa1c7ccd1a7eff4a4659'

  bottle :unneeded

  depends_on "bazel" => :install

  def install
    system 'bazel', 'build', '--config=release', '--experimental_platforms=@io_bazel_rules_go//go/toolchain:darwin_amd64', '//ibazel:ibazel'
    bin.install 'bazel-bin/ibazel/darwin_amd64_pure_stripped/ibazel' => 'ibazel'
  end

  test do
    # Since ibazel loops in most cases the quickest check of valididty
    # I can think of is to get the version output which happens when
    # invoked without any arguments.
    system bin / 'ibazel'
  end
end
