require 'rails_helper'

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

  scenario "when user logs in with in invalid params" do
    visit '/'
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing124'
    click_on 'Login'
    expect(page).to have_text('Login')
  end
end

feature "sign up" do
  scenario "when user signs up with valid params" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', :with => "Ryan"
    fill_in 'Last Name', :with => "Gosling"
    fill_in 'Email', :with => "ryan@gmail.com"
    fill_in 'Password', :with => 'omgryangosling'
    click_on 'Sign Up'
    expect(page).to have_text('Logout')
  end

  scenario "when user signs up with invalid params" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', :with => "Ryan"
    fill_in 'Last Name', :with => 'Gosling'
    fill_in 'Email', :with => 'ryan@gmail.com'
    click_on 'Sign Up'
    expect(page).to_not have_text('Logout')
  end

end
