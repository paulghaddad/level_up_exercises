Given(/^I am on the artists page$/) do
  visit artists_path
end

Given(/^I have (\d+) artists$/) do |arg1|
  artist_1 = create(:artist, first_name: "Claude",  last_name: "Monet")
  artist_2 = create(:artist, first_name: "Edouard", last_name: "Manet")
end

Given(/^I am on a page for an artist$/) do
  artist = create(:artist, first_name: "Andy",  last_name: "Warhol", thumbnail: "http://static1.artsy.net/artist_images/52f6bdda4a04f5d504f69b03/1/four_thirds.jpg")
  visit artist_path(artist)
end

When(/^I click (.+) Artist$/) do |action|
  click_link("#{action} Artist")
end

When(/^I create an invalid artist$/) do
  click_link("New Artist")
  fill_in("First Name", with: "")
  fill_in("Last Name", with: "")
  click_button("Create Artist")
end

When(/^I update the last name to Painter$/) do
  fill_in("Last Name", with: "Painter")
  click_button("Update Artist")
end

When(/^I create a new artist: Henri Matisse$/) do
  click_link("New Artist")
  fill_in("First Name", with: "Henri")
  fill_in("Last Name", with: "Matisse")
  click_button("Create Artist")
end

When(/^I edit an artist: (.+)$/) do |artist|
  click_link(artist)
  click_link("Edit Artist")
end

When(/^I delete the artist: (.+)$/) do |artist|
  click_link(artist)
  click_link("Delete Artist")
end

When(/^I edit an artist with invalid data: (.+)$/) do |artist|
  click_link(artist)
  click_link("Edit Artist")
  fill_in("First Name", with: "")
  fill_in("Last Name", with: "")
  click_button("Update Artist")
end

When(/^I manually add an artist$/) do
  create_artist("Paul Cezanne")
end

When(/^I manually add an existing artist$/) do
  create_artist("Pablo Picasso")
  create_artist("Pablo Picasso")
end

When(/^I manually add a non\-existent artist$/) do
  create_artist("na")
end

Then(/^I should not see (.+) on the Artists page$/) do |artist|
  expect(current_path).to eq(artists_path)
  expect(page).not_to have_content(artist)
end

Then(/^I should see the artist: (.+)$/) do |artist|
  expect(page).to have_content(artist)
end

Then(/^I should see details for the artist: Monet$/) do
  expect(page).to have_content 'Claude Monet'
  expect(page).to have_content 'French'
  expect(page).to have_content 'A founding member of the Impressionist movement in the late 1800s'
end

Then(/^I should be on the artists index$/) do
  expect(current_path).to eq(artists_path)
end

Then(/^I should be on the artist page for (.+)$/) do |artist|
  expect(page).to have_css('h1', text: artist)
end

Then(/^I should see all the artists$/) do
  expect(page).to have_content("Monet")
  expect(page).to have_content("Manet")
end

Then(/^I should see artist validation errors$/) do
  expect(page).to have_content("The artist could not be saved.")
  expect(page).to have_content("Please correct the 2 errors below:")
  expect(page).to have_content("First name can't be blank.")
  expect(page).to have_content("Last name can't be blank.")
end

Then(/^I should see a message confirming the artist was (.+)$/) do |action|
  expect(page).to have_content("The artist was successfully #{action}.")
end

Then(/^I should see a thumbnail image$/) do
  url = "http://static1.artsy.net/artist_images/52f6bdda4a04f5d504f69b03/1/four_thirds.jpg"
  expect(page).to have_selector("img[src='#{url}']")
end

Then(/^I should see a message stating the artist exists$/) do
  expect(page).to have_content("The artist already exists.")
end

Then(/^I should see a message stating the artist does not exist$/) do
  expect(page).to have_content("Sorry. Your search returned no results.")
end

Then(/^the artist should have associated artworks$/) do
  click_link("Paul Cézanne")
  click_link("View All Artworks")
  expect(page).to have_css('h2', "Still Life with Cherries and Peaches")
end