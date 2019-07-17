class Admins::LessonsController < ApplicationController

  def new
  end

  def create
  end

  def index
    @categories = Category.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
