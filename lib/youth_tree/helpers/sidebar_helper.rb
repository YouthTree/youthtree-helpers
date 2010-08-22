module YouthTree
  module Helpers
    module SidebarHelper
      
      # Returns the sidebar content.
      def sidebar_content
        content = content_for :sidebar
        content.present? ? content : default_sidebar
      end

      # Do we have a sidebar?
      def has_sidebar?
        sidebar_content.present? && show_sidebar?
      end

      # Set sidebar content
      def sidebar_contains(*args, &blk)
        content_for :sidebar, *args, &blk
      end

      # Content class, inc. sidebar
      def main_content_class
        (Array(@extra_content_classes) + [has_sidebar? ? "left" : "full-width"]).uniq.sort.join(" ")
      end

      # Render content for sidebar
      def render_to_sidebar!(partial_name, options = {})
        sidebar_contains render(options.merge(:partial => partial_name))
      end
      
      # Renders a default sidebar
      def default_sidebar
        render(:partial => 'shared/default_sidebar')
      end
      
    end
  end
end