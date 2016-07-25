require 'rails_helper'

RSpec.feature "User can log in" do
  scenario "with valid email and password" do
    user = User.create({email: "email@email.com", password: "password"})

    visit root_path

    within(".navbar") do
      expect(page).to have_link("Log In")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Log Out")

      click_link("Log In")
    end

    within(".new_session_form") do
      fill_in "email address", with: user.email
      fill_in "password", with: user.password
      click_button("Log In")
    end

    expect(page).to have_current_path('/links')

    within(".navbar") do
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Sign Up")
      expect(page).to have_link("Log Out")
    end
  end

  scenario "they can logout after logging in" do
    user = User.create({email: "email@email.com", password: "password"})

    visit login_path

    within(".new_session_form") do
      fill_in "email address", with: user.email
      fill_in "password", with: user.password
      click_button("Log In")
    end

    expect(page).to have_current_path('/links')

    within(".navbar") do
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Sign Up")
      expect(page).to have_link("Log Out")

      click_link "Log Out"
    end

    expect(page).to have_current_path('/login')

    within(".navbar") do
      expect(page).to have_link("Log In")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Log Out")

      click_link("Log In")
    end

  end
end
