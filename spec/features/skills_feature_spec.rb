require 'rails_helper'
require 'web_helper'

feature 'Skills' do
  before do
    sign_up
  end

  context 'pre-determined skills have been added' do
    scenario 'signed in' do
      visit '/'
      click_link 'Set confidence'
      expect(page).to have_content 'Ruby'
      expect(page).to have_content 'Agile'
    end
    scenario 'guest user' do
      click_link 'Sign out'
      visit '/confidences/new'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end

  context 'initial confidence levels submitted' do
    scenario 'user fills in initial confidence levels for pre-determined skills' do
      visit 'skills/new'
      within(:css, "#Ruby") do
        select '5', from: 'feedback__rating'
        end
      within(:css, "#Javascript") do
        select '7', from: 'feedback__rating'
      end
      click_button 'Submit'
      expect(current_path).to eq '/skills'
      page.has_css? 'g.highcharts-grid'
      click_link 'View Data Table'
      expect(page).to have_content 'Ruby 5'
      expect(page).to have_content 'Javascript 7'
    end
  end
end

