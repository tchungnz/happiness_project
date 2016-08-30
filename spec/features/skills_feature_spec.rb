require 'rails_helper'

  context 'skills have been added' do
    before do
      Skill.create(name: 'Databases', confidence: 2)
    end

    scenario 'display skills and confidence level' do
      visit '/skills'
      expect(page).to have_content 'Databases'
      expect(page).to have_content '2'
    end
  end

  context 'Adding skills to work on' do
    scenario ' prompts a user to fill out a form, then displays the skill' do
      visit '/skills'
      click_link 'Add a skill'
      fill_in 'Name', with: 'Databases'
      select '2', from: 'Confidence'
      click_button 'Create Skill'
      expect(page).to have_content 'Databases'
      expect(current_path).to eq '/skills'
    end
  end
