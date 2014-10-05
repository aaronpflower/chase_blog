class User < ActiveRecord::Base
	has_many :comments, through: :posts
	# or should it be this
	# has_many :comments, as: imageable
end
