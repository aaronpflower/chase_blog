class Post < ActiveRecord::Base
	belongs_to :admin
	default_scope -> { order('created_at DESC') }
	# to get the admin_spec post asscoication tests to pass. The DESC is SQL for descending
	validates :content, presence: true, length: { maximum: 5000 }
	validates :admin_id, presence: true
end
