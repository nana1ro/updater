class UsersController < ApplicationController

  before_action :authenticate_user!

  def top
    @selected_category = current_user.category
    @new_lessons = Lesson.order(created_at: :desc).limit(10)

    for i in 1..8 do
      eval("@data#{i} = Attend.where(user_id: current_user.id, category_id: #{i}).count")
    end

    attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
    @learning_time = attends_in_a_week.sum(:time)

    if current_user.target_time == nil
      @targeting_time = 0
    elsif current_user.target_time >= @learning_time
      @targeting_time = current_user.target_time - @learning_time
    else
      @targeting_time == @learning_time
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'show'
    end
  end

  def history
    @user = User.find(params[:id])

    @selected_category = current_user.category
    @unselected_categories = Category.where.not(id: current_user.category_id)
    @categories = Category.all

    attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
    @learning_time = attends_in_a_week.sum(:time)

    if current_user.target_time == nil
      @targeting_time = 0
    elsif current_user.target_time >= @learning_time
      @targeting_time = current_user.target_time - @learning_time
    else
      @targeting_time == @learning_time
    end

    attends_before_two_weeks = Attend.two_weeks_attends.where(user_id: current_user.id)
    @learning_time_before_two_weeks = attends_before_two_weeks.sum(:time)

    attends_before_three_weeks = Attend.three_weeks_attends.where(user_id: current_user.id)
    @learning_time_before_three_weeks = attends_before_three_weeks.sum(:time)
  end

  def target_time
    @user = User.find(params[:id])
    @user.target_time = (params[:hour].to_i * 3600) + (params[:minute].to_i * 60)
    if @user.save
      redirect_to history_user_path(@user.id)
    else
      @categories = Category.all
      attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
      @learning_time = attends_in_a_week.sum(:time)

      if current_user.target_time == nil
        @targeting_time = 0
      elsif current_user.target_time >= @learning_time
        @targeting_time = current_user.target_time - @learning_time
      else
        @targeting_time == @learning_time
      end
      render 'history'
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :category_id,
      :target_time
    )
  end

end
