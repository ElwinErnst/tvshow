class Film < ApplicationRecord
  belongs_to :genere
  has_many :seasons

  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
end
