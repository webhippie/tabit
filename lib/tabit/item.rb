module Tabit
  class Item
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    cattr_accessor :template
    attr_accessor :children

    attr_accessor :name
    attr_accessor :url
    attr_accessor :options

    def initialize(name, url = nil, options = {})
      @name, @url, @options = name, url, options
      
      @active = @options.delete(:active) || configuration.active_detect
      @type = @options.delete(:type) || :default

      @children = []

      @options[:inner] ||= {}
      @options[:outer] ||= {}

      clazz = template.active_link_to_class(
        url,
        {
          active: @active,
          class_active: configuration.active_class
        }
      )

      @options[:outer][:class] = '' if @options[:outer][:class].nil?
      @options[:outer][:class] << " #{clazz}"
      @options[:outer][:class].strip!
    end

    def add(name, url = nil, options = {})
      Item.new(name, url, options).tap do |adding|
        @children << adding
        yield adding if block_given?
      end
    end

    def to_s
      case @type
        when :dropdown
          options[:outer][:class] = '' if @options[:outer][:class].nil?
          options[:outer][:class] << " dropdown"
          options[:outer][:class].strip!

          options[:inner][:class] = '' if @options[:inner][:class].nil?
          options[:inner][:class] << " dropdown-toggle"
          options[:inner][:class].strip!

          options[:inner][:data] ||= {}
          options[:inner][:data][:toggle] = 'dropdown'

          template.content_tag(
            :li,
            [
              template.link_to([name, content_tag(:b, '', :class => 'caret')].join.html_safe, url, options[:inner]),
              output
            ].compact.join.html_safe,
            options[:outer]
          )
        else
          template.content_tag(
            :li,
            [
              template.link_to(name, url, options[:inner]),
              output
            ].compact.join.html_safe,
            options[:outer]
          )
      end
    end

    protected
      def output
        if children.empty? 
          nil 
        else
          case @type
            when :dropdown
              template.content_tag(
                :ul,
                children.collect(&:to_s).join.html_safe,
                :class => 'dropdown-menu'
              )
            else
              template.content_tag(
                :ul,
                children.collect(&:to_s).join.html_safe
              )
          end
        end
      end

      def configuration
        Tabit.configuration
      end
  end
end

