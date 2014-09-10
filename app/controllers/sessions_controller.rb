class SessionsController < ApplicationController

	def new
	end

	def create
	 	admin = Admin.find_by(email: params[:session][:email].downcase) # pulls the admin out of the db using the submitted email address
    if admin && admin.authenticate(params[:session][:password]) # this is only true if both admin and admin.authenticate are true
     	sign_in admin
     	redirect_to admin # use admin not admin path
      # Sign the admin in and redirect to the admin's show page.
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

	def destroy
    sign_out
    redirect_to root_url
	end
end
