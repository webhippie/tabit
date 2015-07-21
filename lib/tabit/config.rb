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

class Tabit
  class Config
    attr_accessor :builder_class

    attr_accessor :active_scope
    attr_accessor :active_detect
    attr_accessor :active_class
    attr_accessor :heading_class
    attr_accessor :divider_class

    def initialize(&block)
      self.builder_class = Tabit::Builder

      self.active_scope = :outer
      self.active_detect = :exclusive
      self.active_class = "active"
      self.heading_class = "nav-header"
      self.divider_class = "divider"

      instance_eval(&block) if block_given?
    end
  end
end
