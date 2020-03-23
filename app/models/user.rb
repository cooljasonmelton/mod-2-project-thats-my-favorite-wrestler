class User < ApplicationRecord
    has_many :favorite_moves
    has_many :favorite_wrestlers
    has_many :wrestlers, through: :favorite_wrestlers
    has_many :moves, through: :favorite_moves
end
