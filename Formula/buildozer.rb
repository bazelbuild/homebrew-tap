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

class Buildozer < Formula
  desc "Rewrite multiple Bazel BUILD files using standard commands"
  homepage "https://github.com/bazelbuild/buildtools/"
  url "https://github.com/bazelbuild/buildtools/releases/download/0.25.1/buildozer.mac"
  sha256 "44c172d224d550c5b06f406457b41713376457d7c1d005730bb3386f6da006e6"

  bottle :unneeded

  def install
    bin.install "buildozer.mac" => "buildozer"
  end

  test do
    (testpath/"WORKSPACE").write <<~EOS
      workspace(name = "buildozer_test")
    EOS
    (testpath/"BUILD").write <<~EOS
      package(default_visibility = ["//visibility:private"])
    EOS
    assert_match "fixed #{testpath}/BUILD",
      shell_output(bin/"buildozer 'set default_visibility //visibility:public' //:__pkg__ 2>&1")
    assert_match "visibility:public", File.read(testpath/"BUILD")
  end
end
