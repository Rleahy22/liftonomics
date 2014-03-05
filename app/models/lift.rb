class Lift < ActiveRecord::Base

  validates :name, presence: true
  validates :primary_muscle, presence: true
  validates :instructions_one, presence: true
end
