class Episode < ApplicationRecord
  belongs_to :season

  validates :title, :presence => true
  validates :minutes, :presence => true
end
