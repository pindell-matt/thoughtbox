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
      fill_in 'title', with: 'this'
      fill_in 'url', with: 'https://different-website.com'
      click_button('Save Link')
    end

    within('.new_link_form') do
      fill_in 'title', with: 'that'
      fill_in 'url', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.new_link_form') do
      fill_in 'title', with: 'test'
      fill_in 'url', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.links') do
      expect(page).to have_text('this')
      expect(page).to have_text('that')
      expect(page).to have_text('test')
    end

    # within('.links') do
    #   first('.link').click_button('Mark as Read')
    # end

    fill_in :search, with: 't'

    within('.links') do
      expect(page).to have_text('this')
      expect(page).to have_text('that')
      expect(page).to have_text('test')
    end

    fill_in :search, with: 'th'

    within('.links') do
      expect(page).to have_text('this')
      expect(page).to have_text('that')
      expect(page).to_not have_text('test')
    end

    fill_in :search, with: 'tha'

    within('.links') do
      expect(page).to_not have_text('this')
      expect(page).to have_text('that')
      expect(page).to_not have_text('test')
    end

    fill_in :search, with: 'web'

    within('.links') do
      expect(page).to have_text('this')
      expect(page).to have_text('that')
      expect(page).to have_text('test')
    end

    fill_in :search, with: 'different-web'

    within('.links') do
      expect(page).to have_text('this')
      expect(page).to_not have_text('that')
      expect(page).to_not have_text('test')
    end
  end
end
