require 'rails_helper'
require 'web_helper'

feature 'Confidences' do
  before do
    sign_up
    add_confidences
  end

  context 'viewing the graph' do
    scenario 'user has added day 1 confidences' do
      visit '/skills'
      page.has_css? 'g.highcharts-grid'
      page.has_css? 'highcharts-legend-item'
    end
  end
  context 'viewing the table' do
    scenario 'user has added day 1 confidences' do
      visit '/skills'
      click_link 'View Data Table'
      expect(page).to have_content 'Ruby 5'
      expect(page).to have_content 'Javascript 7'
    end
  end
  scenario 'viewing individual graphs' do
    visit '/skills'
    click_link 'View Data Table'
    click_link 'Ruby'
    page.has_css? 'g.highcharts-grid'
  end
  
end


