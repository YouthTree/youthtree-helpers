module YouthTree
  module Helpers
    module AnalyticsHelper
      
      def clicky_snippet_js(site_id)
        value = <<-END_OF_JS
          var clicky = { log: function(){ return; }, goal: function(){ return; }};
          var clicky_site_id = #{site_id};
          (function() {
            var s = document.createElement('script');
            s.type = 'text/javascript';
            s.async = true;
            s.src = (document.location.protocol + '//static.getclicky.com/js');
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(s);
          })();
        END_OF_JS
        value.gsub(/^\s{10}/, '')
      end
      
      def clicky_analytics
        if Settings.clicky.site_id?
          content = ActiveSupport::SafeBuffer.new
          site_id = Settings.clicky.site_id.to_i;
          content << javascript_tag(clicky_snippet_js(site_id))
          static_image_tag = tag(:img, :width => 1, :height => 1, :src => "#{request.protocol}in.getclicky.com/#{site_id}ns.gif")
          content << content_tag(:noscript, content_tag(:div, static_image_tag, :class => 'clicky-tracker'))
          content
        end
      end
      
      def google_analytics
        if Settings.google_analytics.identifier?
          javascript_tag(google_analytics_snippet_js(Settings.google_analytics.identifier))
        end
      end
      
      def analytics_code
        [clicky_analytics, google_analytics].compact.sum(ActiveSupport::SafeBuffer.new)
      end

      def google_analytics_snippet_js(identifier)
        value = <<-END_OF_JS
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', #{identifier.to_json}]);
          _gaq.push(['_trackPageview']);

          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        END_OF_JS
        value.gsub(/^           /, '')
      end
    end
  end
end