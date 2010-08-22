module YouthTree
  module Helpers
    module EmbedHelper
      
      # Links with added hinting to make them useful for social networking buttons.
      def social_media_link(name, text, link)
        link_to text.html_safe, link, :title => text, :class => "social-media-link #{name.to_s.dasherize}"
      end
      
      # YouTube Video Embed.
      def youtube_video(video_id, opts = {})
        options = {:height => 360, :width => 480, :color1 => 'AAAAAA', :color2 => '999999'}.merge(opts)
        video_url = "http://www.youtube-nocookie.com/v/#{video_id}?hl=en_US&fs=1&rel=0&color1=0x#{options[:color1]}&color2=0x#{options[:color2]}"
        inner = ActiveSupport::SafeBuffer.new.tap do |i|
          i << tag(:param, :name => "movie", :value => video_url)
          i << tag(:param, :name => "allowFullScreen", :value => "true")
          i << tag(:param, :name => "allowscriptaccess", :value => "always")
          i << tag(:embed, :src => video_url, :height => options[:height], :width => options[:width], :allowfullscreen => "true",
            :type => "application/x-shockwave-flash", :allowscriptaccess => "always")
        end
        content_tag(:object, inner, :height => options[:height], :width => options[:width])
      end

      # Share this embed js
      def has_share_this_js
        if Settings.share_this.publisher?
          has_js "http://w.sharethis.com/button/sharethis.js#publisher=#{Settings.share_this.publisher}&amp;type=website&amp;button=false"
          has_jammit_js :share_this
        end
      end

      # Link to share something.
      def share_this_link(text, options = {})
        target = options.delete(:for)
        options.stringify_keys!
        options["data-share-this-target"] = target.to_s if target
        options[:class] = [options[:class], 'share-this'].join(" ").squeeze(" ")
        link_to(text, '#', options)
      end
      
      # Embed a sponsor logo
      def sponsor_link(name, url)
        link_to image_tag("sponsors/#{name.underscore.gsub(/[\ \_]+/, "-")}-logo.jpg"), url, :title => name, :class => 'sponsor'
      end
      
    end
  end
end