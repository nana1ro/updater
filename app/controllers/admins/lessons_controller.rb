class Admins::LessonsController < ApplicationController

  before_action :authenticate_admin!
  layout "headerless", only: :slide

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.time = (params[:lesson][:hour].to_i * 3600) + (params[:lesson][:minute].to_i * 60) + (params[:lesson][:second].to_i)
    if @lesson.save
      redirect_to admins_lessons_path
    else
      render 'new'
    end
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
    @lesson.time = (params[:lesson][:hour].to_i * 3600) + (params[:lesson][:minute].to_i * 60) + (params[:lesson][:second].to_i)
    if @lesson.save
      redirect_to admins_lessons_path
    else
      render 'edit'
    end
  end

  def slide
    @lesson = Lesson.find(params[:id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(
      :category_id,
      :rank_id,
      :name,
      :image,
      :video,
      :description,
      :time,
      :status
    )
  end

end
