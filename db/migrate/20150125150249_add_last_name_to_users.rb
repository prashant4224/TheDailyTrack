class AddLastNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :last_name, :string if !column_exists?(:users, :last_name)
  	add_column :images, :kind, :string if !column_exists?(:images, :kind)
  end
end
