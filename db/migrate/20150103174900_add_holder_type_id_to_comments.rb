class AddHolderTypeIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commentable_type, :string if !column_exists?(:comments, :commentable_type)
  	add_column :comments, :commentable_id, :integer if !column_exists?(:comments, :commentable_id)
  end
end
