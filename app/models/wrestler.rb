class Wrestler < ApplicationRecord
    has_many :favorite_wrestlers
    has_many :users, through: :favorite_wrestlers
    validates :name, :bio, :presence => true


    def self.sort_wrestler_by_name
        self.all.sort do |a, b|
            a.name <=> b.name
        end
    end 

    def get_wrestler_favs
        FavoriteWrestler.all.select do |fav|
          fav.wrestler.id == self.id 
        end 
    end 
    
    def wrestler_average_rating
        ratings = get_wrestler_favs.map do |fav|
            fav.rating
        end 
        ratings.sum / ratings.length.to_f
    end 

    def get_wrestler_comments
        wrestler_comments = get_wrestler_favs.map do |fav|
            "#{fav.user.name} commented: #{fav.comments}"
        end 
        wrestler_comments.reverse
    end 

end
