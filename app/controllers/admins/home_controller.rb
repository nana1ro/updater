class Admins::HomeController < ApplicationController

  def top
  	@lesson_ranking = Lesson.find(Attend.group(:lesson_id).order('count(lesson_id) desc').limit(3).pluck(:lesson_id))
  	@number_of_users = User.count
  	@recent_number_of_users = User.where(created_at: [1.hour.ago..Time.now]).count
  	@number_of_attends = Attend.count
  	@recent_number_of_attends = Attend.where(created_at: [1.hour.ago..Time.now]).count
  end

end
