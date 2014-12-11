class Habit < ActiveRecord::Base
  has_many :journals, dependent: :destroy
  validates :name, presence: true
end
