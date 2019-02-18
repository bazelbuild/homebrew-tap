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
    desc 'Bazelisk is a user-friendly launcher for Bazel.'
    homepage 'https://github.com/philwo/bazelisk'
    url "https://github.com/philwo/bazelisk/releases/download/v0.0.1/bazelisk-darwin-amd64"
    
    # To generate run:
    # curl -L -N -s https://github.com/philwo/bazelisk/releases/download/v0.0.1/bazelisk-darwin-amd64 | shasum -a 256
    # on MacOS
    sha256 'c5da312c70a8540766cd275bdac46e1cc14ab29c3282f70e64af4e046a0a99bc'
  
    bottle :unneeded
  
    conflicts_with "bazelbuild/tap/bazel", :because => "Bazelisk replaces the bazel binary"
  
    def install
      bin.install 'bazelisk-darwin-amd64' => 'bazel'
    end
  
    test do
      # Simply run bazelisk to see whether it finished
      system bin / 'bazel', 'version'
    end
  end
    