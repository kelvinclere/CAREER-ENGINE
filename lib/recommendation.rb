module Recommendation
  def recommend_careers
    similar_users = User.joins(:careers)
                        .where(careers: { id: self.career_ids })
                        .where.not(id: self.id)

    recommendations = Hash.new(0)
    
    similar_users.each do |user|
      # Calculate similarity based on shared careers
      shared_careers = (user.career_ids & self.career_ids).count
      total_careers = user.career_ids.count
      career_weight = shared_careers.to_f / total_careers

      # Calculate grade similarity
      grade_similarity = calculate_grade_similarity(user)

      # Final weight is a combination of career similarity and grade similarity
      total_weight = (career_weight * 0.6) + (grade_similarity * 0.4)

      (user.career_ids - self.career_ids).each do |career_id|
        recommendations[career_id] += total_weight
      end
    end

    sorted_recommendations = recommendations.sort_by { |_, weight| -weight }
    Career.find(sorted_recommendations.map(&:first))
  end

  def recommend_schools
    similar_users = User.joins(:schools)
                        .where(schools: { id: self.school_ids })
                        .where.not(id: self.id)

    recommendations = Hash.new(0)

    similar_users.each do |user|
      shared_schools = (user.school_ids & self.school_ids).count
      total_schools = user.school_ids.count
      school_weight = shared_schools.to_f / total_schools

      grade_similarity = calculate_grade_similarity(user)

      total_weight = (school_weight * 0.6) + (grade_similarity * 0.4)

      (user.school_ids - self.school_ids).each do |school_id|
        recommendations[school_id] += total_weight
      end
    end

    sorted_recommendations = recommendations.sort_by { |_, weight| -weight }
    School.find(sorted_recommendations.map(&:first))
  end

  private

  def calculate_grade_similarity(other_user)
    self_grades = self.grades.index_by(&:subject)
    other_grades = other_user.grades.index_by(&:subject)

    matching_grades = 0
    total_subjects = self_grades.keys.size

    self_grades.each do |subject, grade|
      if other_grades[subject] && other_grades[subject].grade == grade.grade
        matching_grades += 1
      end
    end

    total_subjects > 0 ? matching_grades.to_f / total_subjects : 0.0
  end
end
