class Task < ApplicationRecord
  TASK_STATUS_LIST = [ "to_do", "in_progress", "blocked", "in_review", "done", "archaived" ]
  has_many :task_assignments
  has_many :users, through: :task_assignments
  belongs_to :task_creator, class_name: "User"
  belongs_to :category, optional: true
end
