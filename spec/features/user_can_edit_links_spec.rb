require 'rails_helper'

RSpec.feature "User can edit links", js: true do
  scenario "change title" do
    visit new_user_path

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "password"
      fill_in "confirm password", with: "password"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/links')

    within(".new_link_form") do
      fill_in "title", with: "Valid Link"
      fill_in "url", with: "https://website.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("https://website.com")
      expect(page).to have_button("Edit")
      click_button("Edit")
    end

    expect(page).to have_current_path('/links/1/edit')

    within(".edit_link_form") do
      fill_in :link_title, with: "Updated"
      click_button("Update Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to_not have_text("Valid Link")
      expect(page).to have_text("Updated")
      expect(page).to have_text("https://website.com")
      expect(page).to have_button("Edit")
    end
  end

  scenario "change website to valid url" do
    visit new_user_path

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "password"
      fill_in "confirm password", with: "password"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/links')

    within(".new_link_form") do
      fill_in "title", with: "Valid Link"
      fill_in "url", with: "https://website.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("https://website.com")
      expect(page).to have_button("Edit")
      click_button("Edit")
    end

    expect(page).to have_current_path('/links/1/edit')

    within(".edit_link_form") do
      fill_in :link_url, with: "http://different-site.ca.gov"
      click_button("Update Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to_not have_text("https://website.com")
      expect(page).to have_text("http://different-site.ca.gov")
    end
  end

  scenario "cannot change website to invalid url" do
    visit new_user_path

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "password"
      fill_in "confirm password", with: "password"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/links')

    within(".new_link_form") do
      fill_in "title", with: "Valid Link"
      fill_in "url", with: "https://website.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("https://website.com")
      click_button("Edit")
    end

    expect(page).to have_current_path('/links/1/edit')

    within(".edit_link_form") do
      fill_in :link_url, with: "not a link"
      click_button("Update Link")
    end

    expect(page).to have_current_path('/links')

    within(".links") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("https://website.com")
      expect(page).to_not have_text("not a link")
    end
  end

end
