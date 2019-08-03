class CategoriesController < ApplicationController

  def index
  	@categories = Category.all
  	@lessons = Lesson.where(status: "公開中")
  end

  def show
  	@categories = Category.all
  	category = Category.find(params[:id])
  	@lessons = category.lessons.where(status: "公開中")
  end

end
