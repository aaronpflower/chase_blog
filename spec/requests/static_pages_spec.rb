require 'spec_helper'

describe "Home page" do 

	it "should have the content 'Blog'" do
		visit '/static_pages/home'
		expect(page).to have_content('blog')
	end

	it "should have the title 'Home'" do
		visit '/static_pages/home'
		expect(page).to have_title("JCD | Home")
	end
end

describe "Resources page" do

	it "should have the content 'Resources'" do
		visit '/static_pages/resources'
		expect(page).to have_content('Resources')
	end

	it "should have the title 'Resources'" do
		visit '/static_pages/resources'
		expect(page).to have_content('Resources')
	end
end

describe "About page" do

	it "should have the content 'About'" do
		visit '/static_pages/about'
		expect(page).to have_content('About')
	end

	it "should have the content 'About'" do
		visit '/static_pages/about'
		expect(page).to have_content('About')
	end
end

