Given(/^I am a user$/) do
  user = create(:user, email: "user@example.com", password: "secret", password_confirmation: "secret")
end

When(/^I log in to my account$/) do
  visit signin_path
  fill_in("Email", with: "user@example.com")
  fill_in("Password", with: "secret")
  click_button("Login")
end

Then(/^I should see a message confirming I am logged in$/) do
  expect(page).to have_content("You are succcesfully logged in.")
end
