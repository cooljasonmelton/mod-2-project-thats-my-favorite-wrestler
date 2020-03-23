class Wrestler < ApplicationRecord
    has_many :favorite_wrestlers
    has_many :users, through: :favorite_wrestlers
end
