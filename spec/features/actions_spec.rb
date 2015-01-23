require 'rails_helper'

feature 'new actions' do
  before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
    @opp = Opportunity.create!(user: @user, name: "Burger King", website: "www.burgerking.com", career_page: "www.burgerking.com/jobs")
    @advocate = Advocate.create!(name: "Ronald McDonald", email: "ronald@mcdonalds.com", twitter: "@ronaldmcdonald", opportunity: @opp)
  end

  scenario 'user can get to the new actions page' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'New Action'
    expect(page).to have_content("Add a new action")
  end

  scenario 'user can make a new action when passed valid params' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'New Action'
    fill_in 'What are you doing?', :with => "First Interview"
    fill_in 'actions_meeting_date', :with => "2014-12-25"
    click_on 'Submit'
    expect(page).to have_content("First Interview")
  end

  scenario 'new action fails when passed invalid params' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    click_on 'New Action'
    click_on 'Submit'
    expect(page).to have_content("Add a new action")
  end
end

feature 'view actions' do
  before do
    @user = User.create!(first_name: "test", last_name: "person", email: "test@gmail.com", password: "testing123")
    @opp = Opportunity.create!(user: @user, name: "Burger King", website: "www.burgerking.com", career_page: "www.burgerking.com/jobs")
    @advocate = Advocate.create!(name: "Ronald McDonald", email: "ronald@mcdonalds.com", twitter: "@ronaldmcdonald", opportunity: @opp)
    @action = Action.create!(description: "Phone Interview", opportunity: @opp, advocate: @advocate, meeting_date: "2014-12-10")
    @action2 = Action.create!(description: "Informational Interview", opportunity: @opp, advocate: @advocate, meeting_date: Faker::Date.forward(23))


  end
  scenario 'existing actions show up on opp show page' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    click_on 'Burger King'
    expect(page).to have_content("Phone Interview")
  end

  scenario 'recent actions show actions in the past' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    expect(page).to have_content("Recent Activity Phone Interview on 2014-12-10" )
  end

  scenario 'upcoming actions show in upcoming actions bit' do
    visit root_path
    click_on 'Login'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_on 'Login'
    expect(page).to have_content("What's Next Informational Interview")
  end
end
