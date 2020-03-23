class Move < ApplicationRecord
    has_many :favorite_moves
    has_many :users, through: :favorite_moves


end
