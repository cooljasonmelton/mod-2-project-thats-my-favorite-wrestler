class FavoriteWrestler < ApplicationRecord
    belongs_to :user
    belongs_to :wrestler
end
