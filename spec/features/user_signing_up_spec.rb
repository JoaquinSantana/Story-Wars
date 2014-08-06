require 'spec_helper'

feature 'Signing up' do
	scenario 'Succesfull sign up' do
		visit '/'

		click_link 'Join now'
		fill_in('Name', with: "Tomek")
		fill_in('Email', with: 'example@email.com')
		fill_in('Password', with: 'test1234')
		click_button "Join"
		
		expect(page).to have_content('You have signed up successfully.')
		expect(page).to have_content('Tomek')
		expect(page.current_url).to eq(root_url + 'users/1')
	end
end 
