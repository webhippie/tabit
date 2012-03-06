module Tabit
  class Config
    attr_accessor :active_class
    attr_accessor :active_detect

    attr_accessor :builder_class

    def initialize(&block)
      @active_class = 'active'
      @active_detect = :exclusive

      @builder_class = Tabit::Builder

      instance_eval(&block) if block_given?
    end
  end
end

