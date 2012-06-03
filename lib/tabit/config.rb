module Tabit
  class Config
    attr_accessor :active_class
    attr_accessor :active_detect

    attr_accessor :builder_class

    attr_accessor :heading_class
    attr_accessor :divider_class

    def initialize(&block)
      @active_class = 'active'
      @active_detect = :exclusive

      @builder_class = Tabit::Builder

      @heading_class = 'nav-header'
      @divider_class = 'divider'

      instance_eval(&block) if block_given?
    end
  end
end

