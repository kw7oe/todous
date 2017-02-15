require "rails_helper"

RSpec.feature "User can add profile pictures" do 
	let(:user) { FactoryGirl.create(:user) }

	before do 
		login_as(user)
		visit user_path(user)
	end

	scenario "with valid attributes" do 
		click_link "Add Profile Picture"
		attach_file "Profile Picture", "spec/fixtures/test.jpg"
		click_button "Upload"
		expect(page).to have_content "Profile Picture Added!"
	end

end