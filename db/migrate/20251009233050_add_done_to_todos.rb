class AddDoneToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :done, :boolean
  end
end
