
class RecommendationsController < ApplicationController
  def index
    # @user = User.find(params[:user_id]) 
    @user = current_user || User.first
    @recommended_careers = @user.recommend_careers
    @recommended_schools = @user.recommend_schools
  end
end
