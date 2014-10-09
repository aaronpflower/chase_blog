class AddAdminIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :admin_id, :integer
  end
end
