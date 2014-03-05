class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :weeks, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
end
