class School < ApplicationRecord
    has_many :liked_schools
    has_many :users, through: :liked_schools
end
