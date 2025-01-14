class AddTaskCreatorToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :task_creator, null: false, foreign_key: { to_table: :users }
  end
end
