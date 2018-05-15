class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :set_courses
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def set_courses
    @courses = Course.all
  end

end
