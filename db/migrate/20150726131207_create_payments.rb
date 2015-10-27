class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :fax
      t.string :email
      t.text :response
      t.string :transaction_id

      t.timestamps
    end
  end
end
