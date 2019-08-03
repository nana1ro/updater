class UsersController < ApplicationController

  before_action :authenticate_user!


  def top
    @selected_lessons = current_user.category.lessons.where(status: "公開中")
    @new_lessons = Lesson.order(created_at: :desc).limit(10).where(status: "公開中")

    # 下記、lesson_chart用のデータ

    for i in 1..8 do
      eval("@data#{i} = Attend.where(user_id: current_user.id, category_id: #{i}).count")
    end

    # ここまで

    # 下記、time_chart 用のデータ

    attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
    @learning_time = attends_in_a_week.sum(:time)

    if current_user.target_time == nil
      @targeting_time = 1
    elsif current_user.target_time >= @learning_time
      @targeting_time = current_user.target_time - @learning_time
    else
      @targeting_time == @learning_time
    end

    # ここまで
  end


  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを変更しました"
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

    # 下記、time_chart 用のデータ

    attends_in_a_week = Attend.recent_attends.where(user_id: current_user.id)
    @learning_time = attends_in_a_week.sum(:time)

    if current_user.target_time == nil
      @targeting_time = 1
    elsif current_user.target_time >= @learning_time
      @targeting_time = current_user.target_time - @learning_time
    else
      @targeting_time == @learning_time
    end

    # ここまで

    # 下記、recent_time_chart用のデータ

    attends_before_two_weeks = Attend.two_weeks_attends.where(user_id: current_user.id)
    @learning_time_before_two_weeks = attends_before_two_weeks.sum(:time)

    attends_before_three_weeks = Attend.three_weeks_attends.where(user_id: current_user.id)
    @learning_time_before_three_weeks = attends_before_three_weeks.sum(:time)

     # ここまで
     
  end


  def target_time
    @user = User.find(params[:id])
    @user.target_time = (params[:hour].to_i * 3600) + (params[:minute].to_i * 60)
    if @user.save
      flash[:notice] = "目標時間を変更しました"
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

  def change_category
    @user = User.find(params[:id])
    @user.category_id = params[:category_id]
    @user.save
    redirect_to category_path(params[:category_id])
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
