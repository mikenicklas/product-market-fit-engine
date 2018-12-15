require 'rails_helper'

RSpec.feature "ImportingRecipients", type: :feature do
  let(:user) { create(:user) }

  before do
    create(:product, user: user)
    sign_in user
  end

  it "can add new recipients" do
    visit root_path
    click_on "Add recipient"
    fill_in "recipient[email]", with: "a.recipient@gmail.com"
    fill_in "recipient[first_name]", with: "John"
    fill_in "recipient[last_name]", with: "Smith"
    click_on "Create recipient"
    expect(page).to have_content "recipient was successfully added"
  end
end
