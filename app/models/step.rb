class Step < ApplicationRecord
  belongs_to :recipe
  has_many :ingredients_steps, dependent: :destroy
  has_many :ingredients, through: :ingredients_steps
  accepts_nested_attributes_for :ingredients_steps, allow_destroy: true
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_one_attached :image

  validates :name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..420 }
  validates :time, presence: true, numericality:  { in: 1..1440 }

  scope :ordered, -> { order(:position) }

  before_create :set_position

  def previous
    recipe.steps.where("position < ?", position).order(position: :desc).first
  end

  def next
    recipe.steps.where("position > ?", position).order(position: :asc).first
  end

  private

  def set_position
    max_position = recipe.steps.maximum(:position) || 0
    self.position = max_position + 1
  end
end
