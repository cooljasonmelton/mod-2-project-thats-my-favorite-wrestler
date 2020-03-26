class Move < ApplicationRecord
    has_many :favorite_moves
    has_many :users, through: :favorite_moves
    validates :name, :description, :presence => true


    def self.sort_move_by_name
        self.all.sort do |a, b|
            a.name <=> b.name
        end
    end 

    def get_move_favs
        FavoriteMove.all.select do |fav|
          fav.move.id == self.id 
        end 
    end 
    
    def move_average_rating
        ratings = get_move_favs.map do |fav|
            fav.rating
        end 
        ratings.sum / ratings.length.to_f
    end 


    def get_move_comments
        move_comments = get_move_favs.map do |fav|
            "#{fav.user.name} commented: #{fav.comments}"
        end 
        move_comments.reverse
    end 





end
