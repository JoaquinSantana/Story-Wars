require 'spec_helper'

feature 'Signing up' do
	let!(:user) { FactoryGirl.build(:user) }

	before :each do
		visit '/'
		click_link 'Join now'
	end

	scenario 'Succesfull sign up' do
		
		fill_in('Name', with: user.name)
		fill_in('Email', with: user.email)
		fill_in('Password', with: user.password)
		click_button "Join"
		
		expect(page).to have_content('You have signed up successfully.')
		expect(page).to have_content(user.name)
		expect(page.current_url).to eq(root_url + 'users/1')
	end


	scenario 'Blank field Name' do

		fill_in('Name', with: '')
		fill_in('Email', with: '')
		fill_in('Password', with: '')
		click_button "Join"

		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Email can't be blank")
		expect(page).to have_content("Password can't be blank")
	end
end 
