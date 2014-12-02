def try_code(code, on: "Enter Code")
  fill_in(on, with: code)
  click_button("Enter Code")
end

Given(/^I have entered the activation and deactivation codes$/) do
  visit '/'
  fill_in('Set Activation Code', with: 4444)
  fill_in('Set Deactivation Code', with: 8888)
  click_button("Submit New Code and Boot")
end

Given(/^I am using the default codes$/) do
  visit '/'
  click_button("Boot Bomb")
end

Given(/^the bomb is active$/) do
  fill_in('Enter Code', with: 4444)
  click_button("Enter Code")
  expect(page).to have_content("active")
end

Given(/^I have a bomb with two incorrect attempts$/) do
  try_code(6987)
  try_code(6987)
end

Given(/^the bomb has exploded$/) do
  try_code(6987)
  try_code(6987)
  try_code(6987)
end

When(/^I set the activation and deactivation codes$/) do
  fill_in('Set Activation Code', with: 5678)
  fill_in('Set Deactivation Code', with: 9123)
  click_button("Submit New Code and Boot")
end

When(/^I enter the default activation code$/) do
  try_code(4444)
end

When(/^I enter the incorrect deactivation code$/) do
  try_code(6987)
end

When(/^I enter my correct activation code$/) do
  try_code(1234)
end

When(/^I enter my correct deactivation code$/) do
  try_code(8888)
end

When(/^I enter the correct activation code twice$/) do
  try_code(4444)
  try_code(4444)
end

When(/^I set the activation code to (\d+)$/) do |code|
  fill_in('Set Activation Code', with: code)
end

When(/^I set the deactivation code to (\d+)$/) do |code|
  fill_in('Set Deactivation Code', with: code)
end

When(/^I click the (.+) button$/) do |button|
  click_button(button)
end

When(/^I enter (\d+) in the enter code box$/) do |code|
  fill_in('Enter Code', with: code)
end

When(/^I enter an invalid activation code$/) do
  fill_in('Set Activation Code', with: 'aaaa')
  click_button("Submit New Code and Boot")
end

When(/^I enter an invalid deactivation code$/) do
  fill_in('Set Deactivation Code', with: 'aaaa')
  click_button("Submit New Code and Boot")
end

Then(/^I should see a form validation error$/) do
  expect(page).to have_content('Not a valid code. Must be all numbers.')
end

Then(/^I should see a code entry box$/) do
  expect(page).to have_selector('#code')
  expect(page).to have_content('Enter Code')
end

Then(/^the activation state of the bomb$/) do
  expect(page).to have_selector('.activation-state')
end

Then(/^I should see a set activation code entry box$/) do
  expect(page).to have_selector('#set-activation-code')
end

Then(/^I should see a set deactivation code entry box$/) do
  expect(page).to have_selector('#set-deactivation-code')
end

Then(/^I should see a boot button$/) do
  expect(page).to have_selector('.boot-bomb-button')
end

Then(/^the bomb should be (.+)$/) do |state|
  within(".activation-state") do
    expect(page).to have_content(state)
  end
end

Then(/^the Enter Code button should not work$/) do
  expect(current_path).to eq('/exploded')
end
