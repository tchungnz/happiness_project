require 'rails_helper'
require 'web_helper'

feature 'Confidences' do
  before do
    sign_up
    add_confidences
  end

  context 'user has added day 1 confidences' do
    scenario 'viewing the graph' do
      visit '/skills'
      page.has_css? 'g.highcharts-grid'
      page.has_css? 'highcharts-legend-item'
    end
    scenario 'viewing the table' do
      visit '/skills'
      click_link 'View Data Table'
      expect(page).to have_content 'Ruby 5'
      expect(page).to have_content 'Javascript 7'
    end
    scenario 'viewing individual graphs' do
      visit '/skills'
      click_link 'View Data Table'
      click_link 'Ruby'
      page.has_css? 'g.highcharts-grid'
    end
  end
  before do 
    seven_confidences
  end
  context 'user has added 7 days of confidences' do
    scenario 'viewing the graph' do
      visit '/skills'
      page.has_css? 'g.highcharts-grid'
      page.has_css? 'highcharts-legend-item'
    end
    scenario 'viewing the table' do
      visit '/skills'
      click_link 'View Data Table'
      expect(page).to have_content 'Ruby 5'
      expect(page).to have_content 'Javascript 7'
    end
    scenario 'user has added 7 days of confidences' do
      visit '/skills'
      click_link 'View Data Table'
      click_link 'Ruby'
      page.has_css? 'g.highcharts-grid'
    end
  end
  
end


