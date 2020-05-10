class AddUserRefToTodos < ActiveRecord::Migration[6.0]
  def change
    add_reference :todos, :user, null: true, foreign_key: true
  end
end
