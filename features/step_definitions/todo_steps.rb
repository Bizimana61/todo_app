Given('I am a registered user') do
  @user = User.find_or_create_by!(email: 'cucumber@example.com') do |user|
    user.password = 'Password123@'
    user.password_confirmation = 'Password123@'
    user.name = 'Test User'
  end
end

Given('I am logged in') do
  visit '/login'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'Password123@'
  click_button 'Log in'
end

Given('I am on the todos page') do
  visit todos_path
end

When('I click {string}') do |button_text|
  click_link_or_button button_text
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

Then('I should see {string}') do |text|
  page.has_content?(text) || raise("Expected to see '#{text}' but did not")
end
