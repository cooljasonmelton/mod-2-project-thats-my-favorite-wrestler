class FavoriteWrestler < ApplicationRecord
    belongs_to :user
    belongs_to :wrestler
    validates :user_id, :wrestler_id, :rating, :presence => true

end
