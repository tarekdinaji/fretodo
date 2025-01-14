class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string "title"
      t.string "description"
      t.string "task_status", default: "to_do"
      t.string "task_category"
      t.datetime "deadline"
      t.timestamps
    end
  end
end
