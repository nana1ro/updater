class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@users = User.all.page(params[:page]).per(25)
  end

  def show
  	@user = User.find(params[:id])
    @categories = Category.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_users_path
  end

end
