class UsersController < ApplicationController

  def top
    @selected_category = current_user.category
    @new_lessons = Lesson.order(created_at: :desc).limit(10)

    for i in 1..8 do
      eval("@data#{i} = Attend.where(user_id: current_user.id, category_id: #{i}).count")
    end

    attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
    @learning_time = attends_in_a_week.sum(:time)
    @targeting_time = current_user.target_time - @learning_time
    # FIXME: 時間が登録されてなかった場合にerrorが出てしまう

  end

  def show
    @user = User.find(params[:id])

    attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
    @learning_time = attends_in_a_week.sum(:time)
    @targeting_time = current_user.target_time - @learning_time
    # FIXME: 時間が登録されてなかった場合にerrorが出てしまう

    attends_before_two_weeks = Attend.two_weeks_attends.where(user_id: current_user.id)
    @learning_time_before_two_weeks = attends_before_two_weeks.sum(:time)

    attends_before_three_weeks = Attend.three_weeks_attends.where(user_id: current_user.id)
    @learning_time_before_three_weeks = attends_before_three_weeks.sum(:time)

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
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :category_id, :target_time)
  end

end
