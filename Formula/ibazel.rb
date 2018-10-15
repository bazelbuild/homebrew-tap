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
  url "https://github.com/bazelbuild/bazel-watcher/archive/v0.6.0.tar.gz"
  sha256 '819ae4ff201f62e769e627335b122c84a472671b80d6fa0407b157c0c982b219'

  bottle :unneeded

  depends_on "bazelbuild/tap/bazel" => :build

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
