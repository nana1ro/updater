class LessonsController < ApplicationController

  def show
  	@lesson = Lesson.find(params[:id])
  end

  def search
  end

  def slide
  	@lesson = Lesson.find(params[:id])
  end

end
