class Career < ApplicationRecord
  has_many :liked_careers
  has_many :users, through: :liked_careers
end
