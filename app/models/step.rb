class Step < ApplicationRecord
  belongs_to :recipe
  has_many :ingredients

  validates :name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..420 }
  validates :time, presence: true, numericality:  { in: 1..1440 }
end
