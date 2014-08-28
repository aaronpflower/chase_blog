require 'spec_helper'

describe "Static pages" do

	subject { page }

	let(:base_title) { "JCD" }

describe "Home page" do 
	before { visit root_path }

	it { should have_content('Blog') }
	it { should have_title('JCD') }
	it { should_not have_title('Home') }
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

