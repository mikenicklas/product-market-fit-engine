require 'rails_helper'

RSpec.feature "UserOnboardings", type: :feature do
  it "lets user sign up" do
    visit root_path
    click_on "Sign up"
    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "testing123"
    fill_in "user[password_confirmation]", with: "testing123"
    click_on "Sign up"
    fill_in "product[name]", with: "PM Fit"
    fill_in "product[site_url]", with: "https://pmfit.com"
    fill_in "product[public_contact_email]", with: "contact@pmfit.com"
    fill_in "product[logo_url]", with: "https://s3.amazon.com/bucket/pmfit.png"
    click_on "Complete setup"
    expect(page).to have_content "Your account has been setup!"
  end
end
