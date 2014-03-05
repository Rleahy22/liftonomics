class Week < ActiveRecord::Base
  belongs_to :workout
  has_many :days, dependent: :destroy
end
