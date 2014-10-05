class Post < ActiveRecord::Base
	
	# option 1
	# has_one :admin
	# impacts the Admin model by assuming `admins` db table has a column to hold the Post Primary Key
	# admins.post_id
	
	# option 2
	belongs_to :admin
	# impact the Posts model by assuming `posts` db table has a column to hold the Admin Primary Key
	# posts.admin_id

	has_many :comments, as: :imageable
	has_many :category_posts
	has_many :categories, through: :category_posts

	default_scope -> { order('created_at DESC') }
	# to get the admin_spec post asscoication tests to pass. The DESC is SQL for descending
	validates :content, presence: true, length: { maximum: 5000 }
	validates :admin_id, presence: true
end
