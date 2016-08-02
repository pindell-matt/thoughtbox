require 'rails_helper'

RSpec.feature 'User can sort links alphabetically', js: true do
  scenario "by clicking the Sort Alphabetically' button" do
    visit new_user_path

    within('.new_user_form') do
      fill_in 'email address', with: 'fake@email.com'
      fill_in 'password', with: 'password'
      fill_in 'confirm password', with: 'password'
      click_button('Sign Up')
    end

    expect(page).to have_current_path('/links')

    within('.new_link_form') do
      fill_in 'title', with: 'Z Link'
      fill_in 'url', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.new_link_form') do
      fill_in 'title', with: 'A Link'
      fill_in 'url', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.new_link_form') do
      fill_in 'title', with: 'B Link'
      fill_in 'url', with: 'https://website.com'
      click_button('Save Link')
    end

    expect(page).to have_current_path('/links')

    within('.links') do
      expect(page).to have_selector('ul:first-child', text: 'Z Link')
      expect(page).to have_selector('ul:last-child', text: 'B Link')
    end

    within('.filters') do
      click_button('Sort Alphabetically')
    end

    within('.links') do
      expect(page).to have_selector('ul:first-child', text: 'A Link')
      expect(page).to have_selector('ul:last-child', text: 'Z Link')
    end
  end
end
