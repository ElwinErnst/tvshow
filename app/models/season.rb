class Season < ApplicationRecord
  belongs_to :film
  has_many :episodes

  validates :number, :presence => true
end
