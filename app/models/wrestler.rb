class Wrestler < ApplicationRecord
    has_many :favorite_wrestlers
    has_many :users, through: :favorite_wrestlers

    def self.sort_wrestler_by_name
        self.all.sort do |a, b|
            a.name <=> b.name
        end

    end 
end
