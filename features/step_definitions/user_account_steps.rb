Given(/^I have (\d+) users$/) do |arg1|
  user_1 = create(:user, first_name: "John", email: "user1@example.com")
  user_2 = create(:user, first_name: "David", email: "user2@example.com")
end

Given(/^I am on the users page$/) do
  visit users_path
end

Given(/^I am on the page for a user$/) do
  user_1 = create(:user, first_name: "John", last_name: "Haddad", email: "john@example.com")
  visit user_path(user_1)
end

When(/^I signup as a user$/) do
  click_link("Signup")
  fill_in("First Name", with: "Paul")
  fill_in("Last Name", with: "Haddad")
  fill_in("Email", with: "paul@example.com")
  fill_in("Password", with: "password")
  fill_in("Confirm Password", with: "password")
  click_button("Create Account")
end

When(/^I signup as a user with invalid data$/) do
  click_link("Signup")
  fill_in("First Name", with: "")
  fill_in("Last Name", with: "")
  fill_in("Email", with: "")
  fill_in("Password", with: "")
  fill_in("Confirm Password", with: "")
  click_button("Create Account")
end

When(/^I edit a user with valid data$/) do
  user_1 = create(:user, first_name: "John", last_name: "Haddad", email: "john@example.com", password: "rubyonrails")
  visit edit_user_registration_path
  log_in_as(email: "john@example.com", password: "rubyonrails")
  fill_in("First Name", with: "David")
  fill_in("Current password", with: "rubyonrails")
  click_button("Update Account")
end

When(/^I edit an user with invalid data$/) do
  user_1 = create(:user, first_name: "John", last_name: "Haddad", email: "john@example.com", password: "rubyonrails")
  visit edit_user_registration_path
  log_in_as(email: "john@example.com", password: "rubyonrails")
  fill_in("First Name", with: "")
  fill_in("Current password", with: "rubyonrails")
  click_button("Update Account")
end

When(/^I delete a user$/) do
  user_1 = create(:user, first_name: "John", last_name: "Haddad")
  visit user_path(user_1)
  click_link("Delete Account")
end

Then(/^I should be on my user page$/) do
  expect(page).to have_selector('h1', text: "Your Account")
end

Then(/^I should see a message to check for email confirmation$/) do
  expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
end

Then(/^I should see a message confirming the user was updated$/) do
  expect(page).to have_content("Your account has been updated successfully.")
end

Then(/^I should see a message confirming the user was deleted$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see user validation errors$/) do
  expect(page).to have_content("The user could not be saved.")
  expect(page).to have_content("Please correct")
end

Then(/^I should see all the users$/) do
  expect(page).to have_content("John")
  expect(page).to have_content("David")
end

Then(/^I should see the user's information$/) do
  expect(page).to have_selector('p', text: "John Haddad")
  expect(page).to have_selector('p', text: "john@example.com")
end

Then(/^I should see the updated name$/) do
  expect(page).to have_selector('p', text: "Name: David Haddad")
end

Then(/^I should not see the user on the Users page$/) do
  expect(page).not_to have_content("Paul Haddad")
end
