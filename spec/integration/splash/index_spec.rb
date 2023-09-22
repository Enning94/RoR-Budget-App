require 'rails_helper'

RSpec.describe 'Splash Views #index', type: :system do
  it 'displays list of categories' do
    visit splashes_path
    sleep(5)
    expect(page).to have_content('Welcome to Wallet Watcher!')
    expect(page).to have_content('Get started by signing up or logging in.')
  end

  it "can click on the 'Login' button" do
    visit visit splashes_path

    within('.splash-set') do
      click_link 'Log in'
    end
    expect(page).to have_current_path(new_user_session_path)
  end

  it "can click on the 'Sign up' button" do
    visit visit splashes_path

    within('.splash-set') do
      click_link 'Sign up'
    end
    expect(page).to have_current_path(new_user_registration_path)
  end
end
