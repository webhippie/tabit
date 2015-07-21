# -*- coding: UTF-8 -*-
#
# Copyright (c) 2012-2015 Webhippie <http://www.webhippie.de>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "tabit/version"

Gem::Specification.new do |s|
  s.name = "tabit"
  s.version = Tabit::Version
  s.date = Time.now.strftime("%F")

  s.authors = ["Thomas Boerger"]
  s.email = ["thomas@webhippie.de"]

  s.summary = <<-EOF
    Tabit is a simple tab menu generator
  EOF

  s.description = <<-EOF
    Tabit is a simple tab menu generator. It depends on active_link_to helper.
    If you dont know how to set an item active take a look at it first. The
    generated source is compatible to bootstrap tabs with dropdowns.
  EOF

  s.homepage = "https://github.com/webhippie/tabit"
  s.license = "MIT"

  s.files = ["CHANGELOG.md", "README.md", "LICENSE"]
  s.files += Dir.glob("lib/**/*")

  s.test_files = Dir.glob("spec/**/*")

  s.executables = []
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "yard"
  s.add_development_dependency "rspec"

  s.add_dependency "active_link_to", ">= 1.0.0"
end
