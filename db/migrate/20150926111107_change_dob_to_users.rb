class ChangeDobToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :dob, :datetime, :null => true
  end
end
