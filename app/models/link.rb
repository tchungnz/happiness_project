require 'rubygems'
require 'mechanize'

class Link < ApplicationRecord

  def start_mechanize(url)
    @agent = Mechanize.new
    @page = @agent.get(url)
  end

  def search_skill(resource)
    google_form = @page.form('f')
    google_form.q = resource.name

    @page = @agent.submit(google_form, google_form.buttons.first)
    get_links(resource)
  end

  def get_links(resource)
    @page.links.each do |link|
      if link.href.to_s =~/url.q/
        str=link.href.to_s
        strList=str.split(%r{=|&})
        url=strList[1]
        resource.url_resources << url unless url.include? "webcache"
        resource.save
      end
    end
  end
end
