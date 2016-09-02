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

def add_confidences
  visit '/'
  click_link 'Set confidence'
  within(:css, "#Ruby") do
    select '5', from: 'feedback__rating'
  end
  within(:css, "#Javascript") do
    select '7', from: 'feedback__rating'
  end
  click_button 'Submit'
end

def seven_confidences
  6.times do 
    add_confidences
  end
end
