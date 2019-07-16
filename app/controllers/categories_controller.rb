class CategoriesController < ApplicationController

  def index
  	@categories = Category.all
  	@lessons = Lesson.all
  end

  def show
  	@categories = Category.all
  	@category = Category.find(params[:id])
  end

end
