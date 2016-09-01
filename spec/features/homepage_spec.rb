require 'rails_helper'

feature 'Homepage' do
  context 'user is not signed up/in' do
    scenario 'should display a welcome message' do
      visit '/'
      expect(page).to have_content 'BLOOM.'
    end
  end
end
