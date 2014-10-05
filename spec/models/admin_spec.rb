# There will only be one admin with a valid username and password.  
# It be managed by session cookies
# It should have many posts and comments while also being able to create update and delete posts and comments
# It should be able to update the other static pages
 
require 'spec_helper'

describe Admin do

	before do
		@admin = Admin.new(email: "admin@example.com", password: "foobar", password_confirmation: "foobar") 
	end
	# The before block runs the code inside the block before each example, creating a new @admin instance using Admin.new and valid initialization hash
 
	subject { @admin }
	# Makes the admin the default subject of the test example

	it { should respond_to(:email) }

	# these tests ensure that the constructors admin.email and admin.email are valid
	# the respond_to methods implicitly use the Ruby method respond_to?
	it { should respond_to(:password_digest) } # Since we want users to have a password digest column, a user object should respond to...
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
 	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) } #this starts this test by requiring a Admin object to respond to authenticate
	it { should respond_to(:posts) } 

	it { should be_valid } # verifies that the subject @admin is initially valid

	describe "when email is not valid" do
		before {@admin.email = " "}
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[admin@foo,com admin_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@admin.email = invalid_address
				expect(@admin).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do 
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@admin.email = valid_address
				expect(@admin).to be_valid
			end
		end
	end

	describe "when email is already taken" do 
		before do 
			admin_with_same_email = @admin.dup
			admin_with_same_email.email = @admin.email.upcase
			admin_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "email address with mixed cases" do 
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be saved as all lower-case" do 
			@admin.email = mixed_case_email
			@admin.save
			expect(@admin.reload.email).to eq mixed_case_email.downcase
		end
	end

	describe "when password is not present" do 
		before do
			@admin = Admin.new(email: "admin@example.com", password: " ", password_confirmation: " ") # confused what this all means and does
		end
		it { should_not be_valid }
	end

	describe "when password does not match confirmation" do
		before { @admin.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "with a password that's too short" do 
		before { @admin.password = @admin.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

	describe "return value of authenticate method" do
		before { @admin.save } # this saves the admin to the db so it can be retrieved using find_by
		let(:found_admin) { Admin.find_by(email: @admin.email) } # find_by is accomplished by the let method 

		describe "with valid password" do
			it { should eq found_admin.authenticate(@admin.password) }
		end

		describe "with invalid password" do
			let(:admin_for_invalid_password) { found_admin.authenticate("invalid") }

			it { should_not eq admin_for_invalid_password }
			specify { expect(admin_for_invalid_password).to be_false } # specify method just a synonym for it
		end
	end

	describe "remember_token" do
		before { @admin.save }
		its(:remember_token) { should_not be_blank }
	end

	# describe "posts associations" do
	# 	before { @admin.save }
	# 	let!(:older_post) do
	# 		FactoryGirl.create(:post, admin: @admin, created_at: 1.day.ago)
	# 	end

	# 	let!(:newer_post) do
	# 		FactoryGirl.create(:post, admin: @admin, created_at: 1.hour.ago)
	# 	end

	# 	it "should have the right posts in the right order" do
	# 		expect(@admin.posts.to_a).to eq [newer_post, older_post]
	# 	# This should initially fail because by default posts will be ordered by id, older on top, newer below.  
	# 	# Also it verifies the basic correctness of the has_many association itself by checking that admin.posts effectively returns an array of posts
	# 	# t_a method converts @admin.posts from its default state, Active Record collection proxy to a proper arrray appropriate for comparision
	# 	end
	# end
end

