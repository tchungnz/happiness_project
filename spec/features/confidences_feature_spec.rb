require 'rails_helper'
require 'web_helper'

feature 'Confidences' do
  before do
    sign_up
  end

  context 'skills and initial confidence levels have been set' do
    scenario 'a user sets daily confidence levels' do
      visit '/skills'
      click_link 'Set daily confidence levels'
      select '5', from: 'confidence_level_Ruby'
      click_button 'submit_confidence_level_Ruby'
      select '7', from: 'confidence_level_Javascript'
      click_button 'submit_confidence_level_Javascript'
      click_link 'Submit all'
      expect(current_path).to be '/skills'
      expect(page).to have_content 'Ruby 5'
      expect(page).to have_content 'Javascript 7'
    end
  end

end
