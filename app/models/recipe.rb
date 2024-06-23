class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :description, presence: true, length: { in: 1..200 }
  validates :difficulty, presence: true, numericality: { in: 1..6 }
end
