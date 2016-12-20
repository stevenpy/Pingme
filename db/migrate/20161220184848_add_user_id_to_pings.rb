class AddUserIdToPings < ActiveRecord::Migration[5.0]
  def change
    add_reference :pings, :user, foreign_key: true
  end
end
