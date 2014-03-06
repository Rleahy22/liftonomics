class Lift < ActiveRecord::Base

  validates :name, presence: true
  validates :primary_muscle, presence: true
  validates :instructions_one, presence: true

  def self.search(query)
    if query
      find(:all, conditions: ['name LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
  end
end
