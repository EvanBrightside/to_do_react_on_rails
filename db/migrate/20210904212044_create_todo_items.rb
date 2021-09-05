class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.boolean :complete, default: false
      t.references :user

      t.timestamps
    end
  end
end
