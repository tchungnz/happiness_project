require './app/models/resource_finder.rb'
require 'rails_helper'

describe '#get_links' do
  it "creates a list of urls relating to a skill" do
    start_mechanize('https://www.google.co.uk/')
    search_skill("Test driven development")
    expect(@links).to include 'https://en.wikipedia.org/wiki/Test-driven_development'
  end
end
