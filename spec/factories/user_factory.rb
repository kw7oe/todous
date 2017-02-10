FactoryGirl.define do 
	factory :user do 
		sequence(:name) { |n| "Name #{n}" }
		sequence(:email) { |n| "test#{n}@example.com" }
		password "password"
	end
end
