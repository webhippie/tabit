module Tabit
  autoload :Version, 'tabit/version'
  autoload :Config, 'tabit/config'
  autoload :Railtie, 'tabit/railtie'
  autoload :Helper, 'tabit/helper'
  autoload :Builder, 'tabit/builder'

  def self.configure(&block)
    @configuration = Tabit::Config.new(&block)
  end

  def self.configuration
    @configuration ||= Tabit::Config.new
  end  
end

require 'tabit/railtie' if defined? Rails
require 'tabit/cell' if defined? Cell

