require 'spec_helper'

describe "Static pages" do

	subject { page }

	let(:base_title) { "JCD" }

	describe "Home page" do
		let(:admin) { FactoryGirl.create(:admin) }
		let!(:p1) { FactoryGirl.create(:post, admin: admin, content: "Foo") }
		let!(:p2) { FactoryGirl.create(:post, admin: admin, content: "Bar") }

		before { visit home_path }

		it { should have_content('Blog') }
		it { should have_title('JCD') }
		it { should_not have_title('Home') }
	
		describe "posts" do

			it { should have_content(p1.content) }
			it { should have_content(p2.content) }
			it { should have_content(admin.posts.count) }
		end
	end

	describe "Resources page" do
		before { visit resources_path }

			it { should have_content('Resources') }
			it { should have_title('Resources') }
	end

	describe "About page" do
		before { visit about_path }

			it { should have_content('About') }
			it { should have_title('About') }
	end
end

