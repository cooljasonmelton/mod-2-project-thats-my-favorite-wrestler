class Move < ApplicationRecord
    has_many :favorite_moves
    has_many :users, through: :favorite_moves

    def self.sort_move_by_name
        self.all.sort do |a, b|
            a.name <=> b.name
        end

    end 


end
