require 'rails_helper'
require 'web_helper'

feature 'Skills' do
  before do
    sign_up
  end

  context 'pre-determined skills have been added' do
    scenario 'display skills and input form for confidence level' do
      visit '/skills'
      click_link 'Set confidence'
      expect(page).to have_content 'Ruby'
      expect(page).to have_content 'Agile'
    end
  end

  context 'initial confidence levels submitted' do
    scenario 'user fills in initial confidence levels for pre-determined skills' do
      visit 'skills/new'
      select '2', from: 'confidence_level_Ruby'
      click_button 'submit_confidence_level_Ruby'
      select '1', from: 'confidence_level_Javascript'
      click_button 'submit_confidence_level_Javascript'
      click_link 'Submit all'
      expect(current_path).to eq '/skills'
      expect(page).to have_content 'Ruby 2'
    end
  end

end





  # context 'Adding skills to work on' do
  #   scenario ' prompts a user to fill out a form, then displays the skill' do
  #     visit '/skills'
  #     click_link 'Add a skill'
  #     fill_in 'Name', with: 'Databases'
  #     select '2', from: 'Confidence'
  #     click_button 'Create Skill'
  #     expect(page).to have_content 'Databases'
  #     expect(current_path).to eq '/skills'
  #   end
  # end
