class FavoriteMove < ApplicationRecord
    belongs_to :user
    belongs_to :move
    validates :user_id, :move_id, :rating, :presence => true

end
