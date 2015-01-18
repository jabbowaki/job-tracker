require 'rails-helper'

feature "signin" do
  before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
  end

  scenario "when user logs in with valid params" do
    visit '/'
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    expect(page).to have_text('Logout')
  end
end