class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search


  def set_search
  	@search = Lesson.ransack(params[:q])
  	@search_lessons = @search.result.includes(:rank).where(status: "公開中")
  end


  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :category_id, :lesson_id, :target_time])
  end

end