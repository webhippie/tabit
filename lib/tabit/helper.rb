module Tabit
  module Helper
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::CaptureHelper

    def tabit(clazz = '', options = {}, &block)
      options[:class] ||= clazz.blank? ? '' : clazz

      content_tag(:ul, options) do
        yield(configuration.builder_class.new(self))
      end
    end

    protected
      def configuration
        Tabit.configuration
      end
  end
end

