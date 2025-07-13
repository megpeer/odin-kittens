class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :cuteness, presence: true, numericality: { only_integer: true }
  validates :softness, presence: true, numericality: { only_integer: true }
end
