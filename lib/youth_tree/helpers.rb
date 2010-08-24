require 'active_support/concern'

module YouthTree
  module Helpers
    VERSION = "0.1.4".freeze
    
    extend ActiveSupport::Autoload
    
    autoload :GeneralHelper
    autoload :AnalyticsHelper
    autoload :AssetsHelper
    autoload :EmbedHelper
    autoload :SidebarHelper
    autoload :UuidTrackerHelper
    
    def self.install!
      ActionView::Base.class_eval do
        include GeneralHelper
        include AnalyticsHelper
        include AssetsHelper
        include EmbedHelper
        include SidebarHelper
        include UuidTrackerHelper
      end
    end
    
    if defined?(Rails::Railtie)
      class Railtie < Rails::Railtie
        initializer "youthtree-helpers.setup-helpers" do
          YouthTree::Helpers.install!
        end
      end
    end
    
  end
end
