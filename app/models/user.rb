class User < ApplicationRecord
    has_many :enrollments
    has_many :games, through: :enrollments
end
