ActiveRecord::Base.connection.execute("PRAGMA journal_mode = WAL;")

require 'faker'

# Destroy existing data to avoid duplication
User.destroy_all
Career.destroy_all
School.destroy_all
LikedCareer.destroy_all
LikedSchool.destroy_all
Grade.destroy_all  # Clear any existing grades

# Seed Users (creating 30 users with unique names)
30.times { User.create(name: Faker::Name.unique.name) }

# Seed Careers (adding 15 career options)
careers = [
  "Software Developer", "Data Scientist", "Web Designer", "Product Manager", "Business Analyst", 
  "Project Manager", "UX Designer", "Marketing Manager", "HR Specialist", "Finance Manager", 
  "System Administrator", "DevOps Engineer", "Cybersecurity Expert", "QA Tester", "Data Engineer"
]
careers.each do |career_name|
  Career.create(title: career_name)
end

# Seed Schools (adding 10 schools)
schools = [
  "Harvard University", "MIT", "Stanford University", "University of Cambridge", "Oxford University", 
  "Caltech", "University of Chicago", "Columbia University", "Princeton University", "Yale University"
]
schools.each do |school_name|
  School.create(name: school_name)
end

# Seed Liked Careers (Associating users with careers they like)
User.find_each do |user|
  3.times do
    user.liked_careers.create!(career: Career.order("RANDOM()").first)
  end
end

# Seed Liked Schools (Associating users with schools they like)
User.find_each do |user|
  3.times do
    user.liked_schools.create!(school: School.order("RANDOM()").first)
  end
end

# Seed Grades for each user (randomly assigning grades to subjects)
subjects = ["English", "Kenyan Sign Language", "Integrated Science", "Religion Education", "Agriculture & Nutrition", "Integrated Science Project"
"Social Studies", "Pre-Technical Studies", "Kiswahili", "Mathematics", "Pre-Technical Studies", "Creative Arts and Sports"]
User.find_each do |user|
  subjects.each do |subject|
    user.grades.create!(
      subject: subject,
      grade: ["A", "B", "C"].sample
    )
  end
end

puts "Seeding completed!"
