require 'spec_helper'

describe "Admin pages" do

	subject { page }

	describe "admin page" do
		before { visit admin_path }

		it { should have_content('Admin') }
		it { should have_title('Admin') }
	end
end
