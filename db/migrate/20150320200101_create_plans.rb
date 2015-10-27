class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :team, index: true

      t.timestamps
    end
  end
end
