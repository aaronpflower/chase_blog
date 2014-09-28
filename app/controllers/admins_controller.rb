class AdminsController < ApplicationController
	before_action :signed_in_admin, only: [:show]

	def show
		@admin = Admin.find(params[:id])
		# this needs to route to the post creation page.  Which is only
		# accessed through sessions and can be seen as the "profile page"
	end

	def new 
	end

	def create
	end

	private

		def signed_in_admin
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end
end
