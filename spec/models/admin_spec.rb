require 'spec_helper'

describe Admin do
		
		before do
			@admin = Admin.new(email: "admin@example.com", password: "foobar", password_confirmation: "foobar") 
		end
	 
		subject { @admin }

		it { should respond_to(:email) }
		it { should respond_to(:password_digest) } 
		it { should respond_to(:password) }
		it { should respond_to(:password_confirmation) }
	 	it { should respond_to(:remember_token) }
		it { should respond_to(:authenticate) } 
		it { should respond_to(:posts) } 

		it { should have_many :posts }
		it { should have_many :comments }

		it { should be_valid } # verifies that the subject @admin is initially valid

		describe "when email is not valid" do
			before { @admin.email = " " }
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
end

