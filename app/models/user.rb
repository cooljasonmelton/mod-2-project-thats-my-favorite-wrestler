class User < ApplicationRecord
    has_many :favorite_moves
    has_many :favorite_wrestlers
    has_many :wrestlers, through: :favorite_wrestlers
    has_many :moves, through: :favorite_moves
    validates :name, :bio, :email, :password, :presence => true
    validates :name, uniqueness: { case_sensitive: false }
    has_secure_password

#next three methods find a users top 5 moves
    def user_favorite_moves
        FavoriteMove.all.select do |fav|
            fav.user == self 
        end 
    end 

    def user_fav_move_by_rating
        user_favorite_moves.sort do |a, b|
            a.rating <=> b.rating
        end
    end

    def user_fav_moves_top_five_rated
        user_fav_move_by_rating.reverse[0..4]
    end 

#next three methods find a users top 5 wrestlers
    def user_favorite_wrestlers
        FavoriteWrestler.all.select do |fav|
            fav.user == self 
        end 
    end 

    def user_fav_wrestler_by_rating
        user_favorite_wrestlers.sort do |a, b|
            a.rating <=> b.rating
        end
    end

    def user_fav_wrestlers_top_five_rated
        user_fav_wrestler_by_rating.reverse[0..4]
    end     
end
