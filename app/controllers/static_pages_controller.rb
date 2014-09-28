class StaticPagesController < ApplicationController
  def home
  	def show
  		@posts = @admin.posts.paginate(page: params[:page])
  	end
  end

  def resources
  end

  def about
  end
end
