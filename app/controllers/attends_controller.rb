class AttendsController < ApplicationController

  def create
    lesson = Lesson.find(params[:lesson_id])
  	attend = Attend.new(user_id: current_user.id, lesson_id: lesson.id, category_id: lesson.category.id )
    attend.time = lesson.time
  	attend.save
  	redirect_to top_users_path
  end

  private

  def attend_params
  	params.require(:attend).permit(:user_id, :category_id, :lesson_id, :time)
  end

end
