class AddUserToBrick < ActiveRecord::Migration[7.0]
  def change
    add_reference :bricks, :user, null: false, foreign_key: true
  end
end
