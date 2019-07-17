class UsersController < ApplicationController

  def top
  	@selected_category = current_user.category
  	@new_lessons = Lesson.order(created_at: :desc)
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	render "show"
  end

  def history
  	@selected_category = current_user.category
    @unselected_categories = Category.where.not(id: current_user.category_id)
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :category_id, :lesson_id, :learning_time, :target_time)
  end

end
