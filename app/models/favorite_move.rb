class FavoriteMove < ApplicationRecord
    belongs_to :user
    belongs_to :move
    has_secure_password
end
