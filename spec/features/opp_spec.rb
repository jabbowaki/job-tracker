require 'rails_helper'

feature 'new opportunities' do
  before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
  end

  scenario 'user can get to new opp page' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Add Opportunity'
    expect(page).to have_text("New Opportunity")
  end

  scenario 'user can make a new opportunity' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Add Opportunity'
    fill_in 'Name', :with => "Burger King"
    fill_in 'Website', :with => "www.burgerking.com"
    fill_in 'Career Page', :with => "www.burgerking.com/jobs"
    fill_in 'Notes', :with => "Wow such burgers"
    click_on 'Submit'
    expect(page).to have_content("Burger King")
  end

  scenario "user is redirected back to new opp page when passing invalid params" do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Add Opportunity'
    fill_in 'Website', :with => "www.burgerking.com"
    fill_in 'Career Page', :with => "www.burgerking.com/jobs"
    expect(page).to_not have_content("Burger King")
  end
end

feature 'show opportunities' do
  before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
    @opp = Opportunity.create!(user: @user, name: "Burger King", website: "www.burgerking.com", career_page: "www.burgerking.com/jobs")
  end

  scenario "user can view the specifics of each opp" do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    expect(page).to have_content("Company: Burger King")
  end
end