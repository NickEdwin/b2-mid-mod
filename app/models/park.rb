class Park < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :admission_price

  has_many :rides

  def avg_thrill_rating
    if self.rides.any?
      self.rides.average(:thrill_rating)
    else
      0
    end
  end
end
