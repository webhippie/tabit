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

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)

if File.exist? ENV["BUNDLE_GEMFILE"]
  require "bundler"
  Bundler.setup(:default)
else
  gem "active_link_to", version: ">= 1.0.0"
end

require "active_link_to"

class Tabit
  class << self
    def configure(&block)
      @configuration = Config.new(&block)
    end

    def configuration
      @configuration ||= Config.new
    end
  end
end

require_relative "tabit/version"
require_relative "tabit/item"
require_relative "tabit/helper"
require_relative "tabit/builder"
require_relative "tabit/config"

require_relative "tabit/railtie" if defined? Rails
require_relative "tabit/cell" if defined? Cell
