require "rails_helper"

RSpec.feature "User can create tasks" do 
	let(:user) { FactoryGirl.create(:user) }

	before do 
		login_as(user)
		visit "/"
	end

	scenario "with valid attributes", js: true do 
		fill_in "task[name]", with: "Apple"
		find("input.add_task_field").send_keys :enter

		expect(page).to have_content "Apple"
	end
end
