FactoryGirl.define do
	factory :user do
		name { Faker::Name.first_name } 
		email { Faker::Internet.email }
		password "test1234"
	end
end