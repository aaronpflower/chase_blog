class Post < ActiveRecord::Base
	belongs_to :admin
	has_many :category_posts
	has_many :categories, through: :category_posts
	has_many :comments
	
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 5000 }
	validates :admin_id, presence: true
end
