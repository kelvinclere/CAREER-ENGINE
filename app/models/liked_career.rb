class LikedCareer < ApplicationRecord
  belongs_to :user
  belongs_to :career
end
