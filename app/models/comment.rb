class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :admin
	belongs_to :user
	
	# has_many :comments
end
