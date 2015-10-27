class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :datetime, null: false
  end
end
