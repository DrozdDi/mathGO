class Player < ApplicationRecord
    validates :name, length: { minimum: 2,
        massage: "%{count} characters is the maximum allowed" }

    has_many :battles_players
    has_many :battles, through: :battles_players

    
end
