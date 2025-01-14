class UpdateTaskStatusDefault < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :task_status, from: nil, to: "to_do"
  end
end
