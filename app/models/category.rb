class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy

  DEFAULT_CATEGORY = Category.all

end
