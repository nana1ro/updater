class LessonsController < ApplicationController

  before_action :authenticate_user!, only: [:slide]

  def show
  	@lesson = Lesson.find(params[:id])
  end

  def search
  end

  def slide
  	@lesson = Lesson.find(params[:id])
  end

end
