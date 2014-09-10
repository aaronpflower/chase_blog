class AdminsController < ApplicationController

	def show
		@admin = Admin.find(params[:id])
		# this needs to route to the post creation page.  Which is only
		# accessed through sessions and can be seen as the "profile page"
	end

	def new 
	end
end
