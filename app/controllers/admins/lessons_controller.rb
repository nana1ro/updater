class Admins::LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    redirect_to admins_lessons_path
  end

  def index
    @categories = Category.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    @lesson.save
    redirect_to admins_lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:category_id, :rank_id, :name, :image, :video, :description, :time, :status)
  end

end
