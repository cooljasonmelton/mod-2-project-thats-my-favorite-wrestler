class User < ApplicationRecord
    has_many :favorite_moves
    has_many :favorite_wrestlers
    has_many :wrestlers, through: :favorite_wrestlers
    has_many :moves, through: :favorite_moves

    has_secure_password
    validates :name, uniqueness: { case_sensitive: false }



    
end
