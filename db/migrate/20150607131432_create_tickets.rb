class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.references :team, index: true
      t.references :user, index: true
      t.string :status, default: "pending"
      t.references :objective, index: true

      t.timestamps
    end
  end
end
