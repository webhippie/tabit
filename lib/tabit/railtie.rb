module Tabit
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :action_controller do
      helper Tabit::Helper
    end
  end
end
