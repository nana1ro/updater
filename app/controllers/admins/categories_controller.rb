class Admins::CategoriesController < ApplicationController

  before_action :authenticate_admin!

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def index
    @category = Category.new
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to admins_categories_path
    else
      render 'show'
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admins_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
