require 'rails_helper'

RSpec.feature "User can sign up" do
  scenario "with valid email and password" do
    visit root_path

    within(".navbar") do
      expect(page).to have_link("Log In")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Log Out")

      click_link("Sign Up")
    end

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "password"
      fill_in "confirm password", with: "password"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/links')

    within(".navbar") do
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Sign Up")
      expect(page).to have_link("Log Out")
    end
  end

  xscenario "user passwords must match" do
    visit root_path

    within(".navbar") do
      expect(page).to have_link("Log In")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Log Out")

      click_link("Sign Up")
    end

    within(".new_user_form") do
      fill_in "email address", with: "fake@email.com"
      fill_in "password", with: "foo"
      fill_in "confirm password", with: "bar"
      click_button("Sign Up")
    end

    expect(page).to have_current_path('/users/new')

    within(".navbar") do
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Sign Up")
      expect(page).to have_link("Log Out")
    end
  end
end
