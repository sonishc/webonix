class Project < ApplicationRecord
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :dead_line, presence: true
  validates :user_id, presence: true
end
