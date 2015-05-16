class AddTypeIdToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :postable_type, :string if !column_exists?(:posts, :postable_type)
  	add_column :posts, :postable_id, :integer if !column_exists?(:posts, :postable_id)
  	remove_column :comments, :holder_type if column_exists?(:comments, :holder_type)
  	remove_column :comments, :holder_id if column_exists?(:comments, :holder_id)
  end
end
