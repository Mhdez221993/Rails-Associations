class Game < ApplicationRecord
    has_many :comments, as: :commentable
end
