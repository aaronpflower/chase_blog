require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "JCD" }

describe "Home page" do 

	it "should have the content 'Blog'" do
		visit '/static_pages/home'
		expect(page).to have_content('blog')
	end

	it "should have the title 'Home'" do
		visit '/static_pages/home'
		expect(page).to have_title("#{base_title}")
	end

	it "should not have custom page title" do
		visit '/static_pages/home'
		expect(page).not_to have_title(' | Home')
	end
end

describe "Resources page" do

	it "should have the content 'Resources'" do
		visit '/static_pages/resources'
		expect(page).to have_content('Resources')
	end

	it "should have the title 'Resources'" do
		visit '/static_pages/resources'
		expect(page).to have_title("#{base_title} | Resources")
	end
end

describe "About page" do

	it "should have the content 'About'" do
		visit '/static_pages/about'
		expect(page).to have_content('About')
	end

	it "should have the content 'About'" do
		visit '/static_pages/about'
		expect(page).to have_title("#{base_title} | About")
	end
end
end

