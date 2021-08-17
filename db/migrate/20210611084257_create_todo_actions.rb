class CreateTodoActions < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_actions do |t|
      t.string :name
      t.string :todo_list_id

      t.timestamps
    end
  end
end
