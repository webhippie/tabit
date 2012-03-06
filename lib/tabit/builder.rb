module Tabit
  class Builder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper

    attr_accessor :output_buffer
    attr_accessor :template

    def initialize(template)
      @template = template
    end

    def add(name, url = nil, options = {})
      options[:inner] ||= {}
      options[:outer] ||= {}

      options[:active] ||= configuration.active_detect
      url ||= '#'

      clazz = template.active_link_to_class(
        url,
        {
          :active => options[:active],
          :class_active => configuration.active_class
        }
      )

      options[:outer][:class] = '' if options[:outer][:class].nil?
      options[:outer][:class] << " #{clazz}"
      options[:outer][:class].strip!

      content_tag(:li, name, options[:outer]) do
        template.link_to name, url, options[:inner]
      end
    end

    protected
      def configuration
        Tabit.configuration
      end
  end
end

