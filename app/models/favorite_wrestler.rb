class FavoriteWrestler < ApplicationRecord
    belongs_to :user
    belongs_to :wrestler
    has_secure_password
end
