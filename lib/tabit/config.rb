# -*- encoding : utf-8 -*-
module Tabit
  class Config
    attr_accessor :builder_class

    attr_accessor :active_scope
    attr_accessor :active_detect
    attr_accessor :active_class
    attr_accessor :heading_class
    attr_accessor :divider_class

    def initialize(&block)
      @builder_class = Tabit::Builder

      @active_scope = :outer
      @active_detect = :exclusive
      @active_class = 'active'
      @heading_class = 'nav-header'
      @divider_class = 'divider'

      instance_eval(&block) if block_given?
    end
  end
end
