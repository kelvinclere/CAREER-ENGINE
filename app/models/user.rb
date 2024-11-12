class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  include Recommendation

  
  has_many :liked_careers
  has_many :careers, through: :liked_careers

  has_many :liked_schools
  has_many :schools, through: :liked_schools
  has_many :grades

   def get_grade_for_subject(subject)
    grades.find_by(subject: subject)
  end

  
  def recommend_careers
    # Example recommendation logic for careers (e.g., top 5 careers by a certain factor)
    Career.all.sample(3) # Just an example, you should use your own recommendation logic
  end

  def recommend_schools
    # Example recommendation logic for schools (e.g., top 5 schools by a certain factor)
    School.all.sample(2) # Just an example, you should use your own recommendation logic
  end
end
