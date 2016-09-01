require 'rails_helper'
require 'web_helper'

feature 'Skills' do
  before do
    sign_up
  end

  context 'pre-determined skills have been added' do
    scenario 'display skills and input form for confidence level' do
      visit '/'
      click_link 'Set confidence'
      expect(page).to have_content 'Ruby'
      expect(page).to have_content 'Agile'
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
