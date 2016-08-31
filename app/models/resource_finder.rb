require 'rubygems'
require 'mechanize'
require 'json'


  def start_mechanize(url)
    @agent = Mechanize.new
    @page = @agent.get(url)
  end

  def search_skill(skill)
    google_form = @page.form('f')
    google_form.q = skill

    @page = @agent.submit(google_form, google_form.buttons.first)
    get_links
  end

  def get_links
    @links = []
    @page.links.each do |link|
      if link.href.to_s =~/url.q/
        str=link.href.to_s
        strList=str.split(%r{=|&})
        url=strList[1]
        @links.push(url) unless url.include? "webcache"
      end
    end
    return @links
  end
