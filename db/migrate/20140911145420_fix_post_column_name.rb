class FixPostColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :user_id, :admin_id
  	# remove_index :posts, [:user_id, :created_at]
  	# add_index :posts, [:admin_id, :created_at]
	end
end
