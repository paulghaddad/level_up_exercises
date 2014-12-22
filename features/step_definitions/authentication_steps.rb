When(/^I signup as a user$/) do
  click_link("Signup")
  fill_in("First Name", with: "Paul")
  fill_in("Last Name", with: "Haddad")
  fill_in("Email", with: "paul@example.com")
  fill_in("Password", with: "secret")
  fill_in("Confirm Password", with: "secret")
  click_button("Create Account")
end

Then(/^I should be on my user page$/) do
  expect(page).to have_content("Your account was succesfully created!")
end
