xml.instruct!
        xml.urlset(
        'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
        'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1"
        ) do
        @static_pages.each do |page|
        xml.url do
        xml.loc "#{page}"
        xml.changefreq("monthly")
        xml.priority(1)
        end
        end
        # Name links
        xml.url do
          xml.loc "#{root_url}#contact"
          xml.lastmod Time.now.to_date
          xml.changefreq "monthly"
          xml.priority 1.0
        end


 
