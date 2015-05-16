class AddObjectiveIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :objective, index: true
  end
end
