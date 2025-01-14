class User < ApplicationRecord

  after_initialize :set_default_user_type, if: :new_record?
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :task_assignments
  has_many :tasks, through: :task_assignments
  has_many :created_tasks, class_name: "Task", foreign_key: "task_creator_id"


  validates :first_name, :last_name, presence: true
  validates :user_type, inclusion: { in: %w[user admin manager] }


  USER_TYPE_LIST = [ "admin", "manager", "user"]

  def set_default_user_type
    self.user_type ||= 'user'
  end

end
