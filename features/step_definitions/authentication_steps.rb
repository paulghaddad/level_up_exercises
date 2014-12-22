When(/^I signup as a user$/) do
  click_link("Signup")
  fill_in("First Name", with: "Paul")
  fill_in("Last Name", with: "Haddad")
  fill_in("Email", with: "paul@example.com")
  fill_in("Password", with: "secret")
  fill_in("Confirm Password", with: "secret")
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

Then(/^I should be on my user page$/) do
  expect(page).to have_selector('h1', text: "Your Account")
end

Then(/^I should see a message confirming the user was created$/) do
  expect(page).to have_content("Your account was succesfully created!")
end

Then(/^I should see user validation errors$/) do
  expect(page).to have_content("The user could not be saved.")
  expect(page).to have_content("Please correct the 7 errors below:")
  expect(page).to have_content("Password can't be blank")
  expect(page).to have_content("First name can't be blank.")
  expect(page).to have_content("First name is too short (minimum is 2 characters).")
  expect(page).to have_content("Last name can't be blank.")
  expect(page).to have_content("Last name is too short (minimum is 2 characters).")
  expect(page).to have_content("Email can't be blank.")
  expect(page).to have_content("Email is invalid.")
end
