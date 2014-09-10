require 'spec_helper'

describe "Admin pages" do

	subject { page }

	describe "admin page" do
		let(:admin) { FactoryGirl.create(:admin) }
		before { visit admin_path(admin) }

		it { should have_content(admin.email) }
		it { should have_title('Admin') }
	end
end
