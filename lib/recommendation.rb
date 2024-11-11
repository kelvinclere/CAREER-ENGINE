
module Recommendation
  def recommend_careers
    similar_users = User.joins(:careers)
                        .where(careers: { id: self.career_ids })
                        .where.not(id: self.id)

    recommendations = Hash.new(0)
    
    similar_users.each do |user|
      shared_careers = (user.career_ids & self.career_ids).count
      total_careers = user.career_ids.count

      weight = shared_careers.to_f / total_careers

      (user.career_ids - self.career_ids).each do |career_id|
        recommendations[career_id] += weight
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

      weight = shared_schools.to_f / total_schools

      (user.school_ids - self.school_ids).each do |school_id|
        recommendations[school_id] += weight
      end
    end

    sorted_recommendations = recommendations.sort_by { |_, weight| -weight }
    School.find(sorted_recommendations.map(&:first))
  end
end
