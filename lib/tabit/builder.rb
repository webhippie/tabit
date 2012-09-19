# -*- encoding : utf-8 -*-
module Tabit
  class Builder < Item
    def initialize(template, options, &block)
      @@template = template

      @children = []
      @options = options

      yield self if block_given?
    end

    def to_s
      template.content_tag(
        :ul,
        children.collect(&:to_s).join.html_safe,
        options
      )
    end
  end
end
