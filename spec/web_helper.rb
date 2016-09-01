def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  within(:css, "#new_user") do
    click_button 'Sign up'
  end
end
