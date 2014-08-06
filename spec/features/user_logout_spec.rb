require 'spec_helper'

feature 'user logout' do
	scenario 'correct logout' do
		user = FactoryGirl.create(:user)

		visit '/'
		click_link 'Login'
		fill_in('Email', with: user.email)
		fill_in('Password', with: user.password)
		click_button "Login"

		expect(page).to have_content("Signed in successfully")

		click_link "#{user.name}"
		click_link "Logout"

		expect(page.current_url).to eq(root_url)
	end
end