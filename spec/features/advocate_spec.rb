require 'rails_helper'

feature 'new advocates' do
  before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
    @opp = Opportunity.create!(user: @user, name: "Burger King", website: "www.burgerking.com", career_page: "www.burgerking.com/jobs")
  end

  scenario 'user can get to new advocate page from opp show' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'Add new Advocate'
    expect(page).to have_content('Add an advocate!')
  end

  scenario 'user can make an advocate' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'Add new Advocate'
    fill_in 'Name', :with => 'Ronald McDonald'
    fill_in 'Email', :with => 'ronald@mcdonalds.com'
    fill_in 'Twitter Handle', :with => '@ronaldmcd'
    click_on 'Submit'
    expect(page).to have_content("Advocates Ronald McDonald")
  end

  scenario "advocate isn't made when passed invalid params" do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'Add new Advocate'
    fill_in 'Email', :with => 'ronald@mcdonalds.com'
    fill_in 'Twitter Handle', :with => '@ronaldmcd'
    click_on 'Submit'
    expect(page).to have_content("Add an advocate")
  end
end

feature 'update advocate' do
    before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
    @opp = Opportunity.create!(user: @user, name: "Burger King", website: "www.burgerking.com", career_page: "www.burgerking.com/jobs")
    @advocate = Advocate.create!(name: "Ronald McDonald", email: "ronald@mcdonalds.com", twitter: "@ronaldmcdonald", opportunity: @opp)
  end

  scenario "advocate can get to update page" do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'Update'
    expect(page).to have_content("Edit your advocate!")
  end

  scenario "advocates can be updated" do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'Update'
    fill_in 'Blog', :with => 'www.mickeyds/blog.com'
    click_on 'Submit'
    expect(page).to have_content("Ronald McDonald ronald@mcdonalds.com @ronaldmcdonald Blog")
  end

end