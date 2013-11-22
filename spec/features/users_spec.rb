# user signs in, is confirmed, uses app as signed in user
require'spec_helper'

feature 'user sign in' do 
  background do
    # create user
  end

  scenario 'multiple users sign in and view their own entries' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user_entry = FactoryGirl.create(:entry, :user => user)
    user2_entry = FactoryGirl.create(:entry, :user => user2)


    # user comes to app front page
    visit root_path
    # user fills in email field with email
    fill_in 'Email' , with: user.email 
    # user fills in password field with password
    fill_in 'Password' , with: user.password
    # user clicks log in button
    click_button 'Sign in'

    expect(page).to have_content user_entry.positive_activity
    expect(page).to have_no_content user2_entry.positive_activity

    
  end


  scenario 'user signs in' do 
    user = FactoryGirl.create(:user)  

    # user comes to app front page
    visit root_path
    # user fills in email field with email
    fill_in 'Email' , with: user.email 
    # user fills in password field with password
    fill_in 'Password' , with: user.password
    # user clicks log in button
    click_button 'Sign in'

    # user sees listing entries page
    expect(current_path).to eq root_path
    expect(page).to have_content 'entries'   
    
    # user clicks new entry link
    # user creates new entry
    # user clicks save button
    click_link 'New Entry'
    
    fill_in 'Physical location' , with: 'fakeplace'
    fill_in 'Place' , with: 'fakeplace'
    fill_in 'Mood' , with: 'fakemood'
    # todo: test the date select 'Took place at' , with: 'fake_date_time'
    fill_in 'Positive activity' , with: "fakeactivity"
    click_button 'Save'
    
    # user sees listing entries page with new entry included
    expect(page).to have_content 'fakeactivity'
  end 
end
