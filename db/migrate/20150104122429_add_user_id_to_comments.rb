class AddUserIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :integer if !column_exists?(:comments, :user_id)
  end
end
