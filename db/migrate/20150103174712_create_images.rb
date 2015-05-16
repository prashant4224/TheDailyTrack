class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :holder_type
      t.integer :holder_id

      t.timestamps
    end
  end
end
