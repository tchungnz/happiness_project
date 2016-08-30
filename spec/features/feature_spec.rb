require 'rails_helper'

feature 'Homepage' do
  context 'user is not signed up/in' do
    scenario 'should display a welcome message' do
      visit '/skills'
      expect(page).to have_content 'Welcome to The Happiness Project'
    end
  end
end
