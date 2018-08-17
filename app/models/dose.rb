class Dose < ApplicationRecord
  belongs_to :ingredient, optional: true
  belongs_to :cocktail
  # has_and_belongs_to_many :ingredients
  validates :ingredient, :cocktail, :description, presence: true
  validates_uniqueness_of :cocktail, scope: [:ingredient]
end
