class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.integer :photo_holder_id, :null => false
      t.string :photo_holder_type, :null => false, :limit => 20
      t.references :user, index: true

      t.timestamps
    end
    add_index :photos, [:photo_holder_id, :photo_holder_type]
  end
end
