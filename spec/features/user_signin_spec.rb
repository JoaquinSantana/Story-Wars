require 'spec_helper'

feature 'Signin' do
	let!(:user) { FactoryGirl.create(:user) }
	before :each do
		visit '/'
		click_link 'Login'
	end

	scenario 'Correnct login via form' do

		fill_in('Email', with: user.email)
		fill_in('Password', with: user.password)
		click_button "Login"

		expect(page).to have_content("Signed in successfully")
	end

	scenario 'Blank fileds' do
		fill_in('Email', with: "")
		fill_in('Password', with: "")
		click_button "Login"

		expect(page).to have_content("Invalid email/password combination")
	end

end