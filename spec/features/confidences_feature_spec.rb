require 'rails_helper'
require 'web_helper'

feature 'Confidences' do
  before do
    sign_up
  end

  context 'skills and initial confidence levels have been set' do
    scenario 'a user sets daily confidence levels' do
      visit '/skills'
      click_link 'Set confidence'
      within(:css, "#Ruby") do
        select '5', from: 'feedback__rating'
      end
      within(:css, "#Javascript") do
        select '7', from: 'feedback__rating'
      end
      click_button 'Submit'
      expect(current_path).to eq '/skills'
      expect(page).to have_content '5'
      expect(page).to have_content '7'
    end
  end

end
