module YouthTree
  module Helpers
    module GeneralHelper
      
      # Returns a nicely formatted date rang.
      def pretty_date_range(from, to)
        from_day, to_day = from.day.ordinalize, to.day.ordinalize
        if [from.day, from.month, from.year] == [to.day, to.month, to.year]
          "#{ampm from} to #{ampm to}, #{to_day} #{to.strftime "%B, %Y"}"
        elsif [from.month, from.year] == [to.month, to.year]
          "#{ampm from} #{from_day} to #{ampm to} #{to_day}, #{to.strftime "%B, %Y"}"
        else
          "#{ampm from} #{from_day}, #{from.strftime "%B, %Y"} to #{ampm to} #{to_day}, #{to.strftime "%B, %Y"}"
        end
      end

      # Returns a nicely formated am/pm time with leading zeroes dropped.
      def ampm(t)
        t.strftime("%I:%M %p").gsub(/^0/, '')
      end

      # A prettier form of the time.
      def pretty_time(t)
        "#{ampm t}, #{t.day.ordinalize} #{t.strftime "%B, %Y"}"
      end
      
      # Returns the first paragraph of text, requires nokogiri.
      def first_paragraph_of(text)
        if defined?(Nokogiri)
          Nokogiri::HTML(text).at('p').try(:to_html).try(:html_safe) || text
        end
      end

      # Returns a simple meta tag.
      def meta_tag(name, content)
        tag(:meta, :name => name.to_s, :content => content.to_s)
      end

      # Published at for almost_happy.
      def formatted_published_time(object)
        object.published_at.blank? ? "Not yet published" : l(object.published_at, :format => :long)
      end

      # Content with links converted to their absolute version.
      # doesn't take into account https etc.
      def absolutize_links(html)
        return unless defined?(Nokogiri)
        doc = Nokogiri::HTML(html)
        doc.search('a').each do |link|
          href = link['href'].to_s
          link['href'] = "http://#{request.host}#{href}" if href =~ /^\//
        end
        doc.at('*').to_html.html_safe
      end

      # Returns a button
      def button_tag(text, opts = {})
        content_tag :button, text, opts
      end
      
      # Shorthand to render a partial, defaulting to passing object / locals
      # instead of options.
      def partial(name, options = nil)
        opts = {:partial => name.to_s}
        if options.is_a?(Hash)
          opts[:locals] = options
        elsif options.present?
          opts[:object] = options
        end
        render opts
      end
      
      # Simple menu item shorthand.
      def menu_link(*args, &blk)
        content_tag(:li, link_to(*args, &blk), :class => 'menu-item')
      end
      alias ml menu_link
      
      # Properly formatted copyright text.
      def copyright(year, now = Time.now)
        if now.year == year
          year.to_s
        elsif year / 1000 == now.year / 1000 # same century
          year.to_s + "&ndash;" + now.year.to_s[-2..3]
        else
          year.to_s + "&ndash;" + now.year.to_s
        end
      end
      
      # Simply boolean display
      def yes_no?(value)
        value ? "Yes" : "No"
      end

      # Returns value for _destroy.
      def destroy_value(form)
        form.object._destroy ? 1 : 0
      end

      # URL with ssl included.
      def uri2ssl(url)
        parts = url.to_s.split("://", 2)
        "#{Settings.ssl_protocol}://#{parts[1] || parts[0]}"
      end

      # URL opts with ssl merged.
      def ssl_opts(opts = {})
        opts.merge(:protocol => Settings.ssl_protocol)
      end

      # Generate flash message html
      def flash_messages(*names)
        names = names.select { |k| flash[k].present? }
        return if names.blank?
        content = []
        names.each_with_index do |key, idx|
          value = flash[key]
          first, last = (idx == 0), (idx == names.length - 1)
          content << content_tag(:p, value, :class => "flash #{key} #{"first" if first} #{"last" if last}".strip)
        end
        content_tag(:section, content.sum(ActiveSupport::SafeBuffer.new), :id => "flash-messages").html_safe
      end
      
      # HTML for an inline button.
      def inline_button(text, url, opts = {})
        form_tag(url) do
          concat content_tag(:button, text, :type => "submit")
        end
      end
      
      
    end
  end
end