require 'rails_helper'
require 'web_helper'

feature 'Homepage' do
  scenario 'guest' do
    visit '/'
    expect(page).to have_content 'BLOOM.'
    expect(page).to_not have_link 'Set confidence'
  end
  scenario 'signed in' do
    sign_up
    visit '/'
    expect(page).to have_link 'Set confidence'
  end
end
