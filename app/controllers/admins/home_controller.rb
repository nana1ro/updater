class Admins::HomeController < ApplicationController

  before_action :authenticate_admin!

  def top
  	@lesson_ranking = Lesson.create_ranking
  	@number_of_users = User.count
  	@recent_number_of_users = User.recent_signups.count
  	@number_of_attends = Attend.count
  	@recent_number_of_attends = Attend.recent_attends.count
  end

end
