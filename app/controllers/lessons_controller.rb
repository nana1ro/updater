class LessonsController < ApplicationController

  before_action :authenticate_user!, only: [:slide]
  before_action :invalid_access, only: [:slide]
  layout "slide", only: :slide

  def show
  	@lesson = Lesson.find(params[:id])
  end

  def search
  end

  def slide
  	@lesson = Lesson.find(params[:id])
  end

  private

  def invalid_access
    lesson = Lesson.find(params[:id])
    if lesson.status == "公開停止中"
      flash[:alert] = "無効なアクセスです"
      redirect_to lesson_path(lesson.id)
    end
  end

end
