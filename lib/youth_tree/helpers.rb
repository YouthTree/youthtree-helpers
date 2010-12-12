require 'active_support/concern'

module YouthTree
  module Helpers
    VERSION = "0.2.0".freeze
    
    extend ActiveSupport::Autoload
    
    autoload :GeneralHelper
    autoload :AnalyticsHelper
    autoload :AssetsHelper
    autoload :EmbedHelper
    autoload :SidebarHelper
    autoload :UuidTrackerHelper
    autoload :FormBuilder
    
    def self.install!
      ActionView::Base.class_eval do
        include GeneralHelper
        include AnalyticsHelper
        include AssetsHelper
        include EmbedHelper
        include SidebarHelper
        include UuidTrackerHelper
      end
      FormBuilder.install!
    end
    
    if defined?(Rails::Railtie)
      class Railtie < Rails::Railtie
        initializer "youthtree-helpers.setup-helpers" do
          YouthTree::Helpers.install!
        end
        
        initializer "youthtree-helpers.setup-i18n" do
          config.i18n.load_path += Dir[Pathname(__FILE__).dirname.join("locales", "**", "*.{yml,rb}")]
        end
        
      end
    end
    
  end
end
