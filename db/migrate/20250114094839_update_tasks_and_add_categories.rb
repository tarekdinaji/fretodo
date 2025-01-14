class UpdateTasksAndAddCategories < ActiveRecord::Migration[7.1]
  def change
    # Create categories table
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    # Remove task_category column from tasks
    remove_column :tasks, :task_category, :string

    # Add a foreign key reference to categories in tasks
    add_reference :tasks, :category, foreign_key: true, null: true
  end
end
