class User < ApplicationRecord
    has_many :comments, as: :commentable
end
