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
  class Item
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    cattr_accessor :template
    attr_accessor :children

    attr_accessor :name
    attr_accessor :url
    attr_accessor :options
    attr_accessor :active
    attr_accessor :type

    def initialize(name, url = nil, options = {})
      self.name = name
      self.url = url
      self.options = options

      self.active = self.options.delete(:active) || configuration.active_detect
      self.type = self.options.delete(:type) || :default
    end

    def add(name, url = nil, options = {})
      Item.new(name, url, options).tap do |adding|
        children.push adding
        yield adding if block_given?
      end
    end

    def heading(name = nil, options = {})
      append_class_to_options configuration.heading_class, options

      children.push template.content_tag(
        :li,
        name,
        options
      )
    end

    def divider(name = nil, options = {})
      append_class_to_options configuration.divider_class, options

      children.push template.content_tag(
        :li,
        name,
        options
      )
    end

    def to_s
      configure_item_attrs

      case type
      when :dropdown
        generate_dropdown_item
      else
        generate_default_item
      end
    end

    def active?
      if template.is_active_link? url, active
        true
      else
        children.each do |child|
          return true if child.active?
        end

        false
      end
    end

    def children
      @children ||= []
    end

    def options
      @options[:inner] ||= {}
      @options[:outer] ||= {}

      @options
    end

    protected

    def current_active_class
      if active?
        configuration.active_class
      else
        ""
      end
    end

    def configure_item_attrs
      case configuration.active_scope
      when :outer
        append_class_to_options current_active_class, options[:outer]
      when :inner
        append_class_to_options current_active_class, options[:inner]
      end
    end

    def generate_dropdown_item
      append_class_to_options "dropdown", options[:outer]
      append_class_to_options "dropdown-toggle", options[:inner]

      append_toggle_to_options "dropdown", options[:inner]

      generate_simple_item(
        [name, content_tag(:span, "", class: "caret")].join.html_safe
      )
    end

    def generate_default_item
      generate_simple_item(
        name
      )
    end

    def generate_simple_item(label)
      template.content_tag(
        :li,
        [
          template.link_to(
            label,
            url,
            options[:inner]
          ),
          output
        ].compact.join.html_safe,
        options[:outer]
      )
    end

    def append_class_to_options(clazz, target = nil)
      target ||= options

      target[:class] ||= ""
      target[:class] << " #{clazz}"
      target[:class].strip!
    end

    def append_toggle_to_options(clazz, target = nil)
      target ||= options

      target[:data] ||= {}
      target[:data][:toggle] = clazz
    end

    def output
      return if children.empty?

      case type
      when :dropdown
        list "dropdown-menu"
      else
        list
      end
    end

    def list(clazz = nil)
      template.content_tag(
        :ul,
        children.collect(&:to_s).join.html_safe,
        class: clazz
      )
    end

    def configuration
      Tabit.configuration
    end
  end
end
