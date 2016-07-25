require 'rails_helper'

RSpec.feature "User can submit links" do
  scenario "with valid urls" do
    visit new_user_path

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "password"
      fill_in "confirm password", with: "password"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to_not have_text("Valid Link")
      expect(page).to_not have_link("http://google.com")
    end

    within(".new_link_form") do
      fill_in "title", with: "Valid Link"
      fill_in "url", with: "http://google.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_link("http://google.com")
    end
  end

  scenario "not with invalid urls" do
    visit new_user_path

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "password"
      fill_in "confirm password", with: "password"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to_not have_text("Invalid Link")
      expect(page).to_not have_link("http://google.com")
    end

    within(".new_link_form") do
      fill_in "title", with: "Invalid Link"
      fill_in "url", with: "hzzp://google.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    expect(page).to_not have_text("Invalid Link")
    expect(page).to_not have_link("http://google.com")
  end
end
