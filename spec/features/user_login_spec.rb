require 'rails_helper'

RSpec.feature "Visitors can log into their account", type: :feature, js: true do

  #SETUP 
  before :each do
    @user = User.create!(
      name: "Lara Croft",
      email: "alwaysraiding@tombs.com",
      password: "climbingaxe",
      password_confirmation: "climbingaxe"
    )
  end

  scenario "Upon successful login, user is directed to the home page" do
    # ACT
    visit root_path
    click_on("Login")

    fill_in "email", with: @user.email
    fill_in "password", with: @user.password

    click_on("Submit")

    # DEBUG
    save_screenshot "login.png"

    #VERIFY
    expect(page).to have_content "Signed in as #{@user.name}" && "Logout"

  end

end
