require 'rails_helper'

RSpec.feature "User can update links", js: true do
  scenario "as read" do
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
      expect(page).to_not have_text("http://google.com")
      expect(page).to_not have_button("Mark as Read")
    end

    within(".new_link_form") do
      fill_in "title", with: "Valid Link"
      fill_in "url", with: "http://google.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Read")

      click_button("Mark as Read")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Unread")
    end
  end

  scenario "as unread" do
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
      expect(page).to_not have_text("http://google.com")
      expect(page).to_not have_button("Mark as Read")
    end

    within(".new_link_form") do
      fill_in "title", with: "Valid Link"
      fill_in "url", with: "http://google.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Read")

      click_button("Mark as Read")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Unread")

      click_button("Mark as Unread")
    end

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Read")
    end
  end
end
