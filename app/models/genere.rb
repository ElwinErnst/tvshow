class Genere < ApplicationRecord
    has_many :films

    validates :name, :presence => true, :uniqueness => true
end
