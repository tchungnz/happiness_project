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
end

