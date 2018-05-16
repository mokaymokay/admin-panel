class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_courses, :identify_current_user
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

  def identify_current_user
    if current_user
      type = current_user.userable_type
      if type == "Admin"
        @logged_in = Admin.find(current_user.userable_id)
      else
        @logged_in = Instructor.find(current_user.userable_id)
      end
    end
  end

end
