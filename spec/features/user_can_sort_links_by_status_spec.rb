require 'rails_helper'

RSpec.feature 'User can sort links by status', js: true do
  scenario "by clicking the 'Show Read' button" do
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

    within('.links') do
      expect(page).to have_text('Z Link')
      expect(page).to have_text('A Link')
      expect(page).to have_text('B Link')
    end

    within('.links') do
      first('.link').click_button('Mark as Read')
    end

    within('.filters') do
      click_button('Show Read')
    end

    within('.links') do
      expect(page).to have_text('Z Link')
      expect(page).to_not have_text('A Link')
      expect(page).to_not have_text('B Link')
    end

    within('.filters') do
      click_button('Show All')
    end

    within('.links') do
      expect(page).to have_text('Z Link')
      expect(page).to have_text('A Link')
      expect(page).to have_text('B Link')
    end
  end
end
