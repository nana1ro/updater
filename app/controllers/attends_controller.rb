class AttendsController < ApplicationController

  def create
    lesson = Lesson.find(params[:lesson_id])
  	attend = Attend.new(user_id: current_user.id, lesson_id: lesson.id, category_id: lesson.category.id )
    attend.time = lesson.name
  	if attend.save
      flash[:notice] = "受講が完了しました"
  	  redirect_to top_users_path
    else
      redirect_to slide_lesson_path(lesson.id), flash: {danger: "エラーにより受講情報を登録できませんでした"}
    end
  end

  private

  def attend_params
  	params.require(:attend).permit(:user_id, :category_id, :lesson_id, :time)
  end

end
