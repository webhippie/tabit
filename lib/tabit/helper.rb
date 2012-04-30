module Tabit
  module Helper
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    def tabit(options = {}, &block)
      configuration
        .builder_class
        .new(self, options, &block).to_s
    end

    protected
      def configuration
        Tabit.configuration
      end
  end
end

