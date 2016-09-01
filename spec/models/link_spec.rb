require 'rails_helper'

describe Link do

link = Link.new(:name => "Test Driven Development", :url_resources => [])
  it "creates a list of urls relating to a skill" do
    link.start_mechanize('https://www.google.co.uk/')
    link.search_skill(link)
    expect(link.url_resources).to include 'https://en.wikipedia.org/wiki/Test-driven_development'
  end
end
