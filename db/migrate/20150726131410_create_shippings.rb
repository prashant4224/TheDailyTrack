class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.references :payment, index: true

      t.timestamps
    end
  end
end
