class ApplicationController < ActionController::Base

  before_action :set_courses

  def set_courses
    @courses = Course.all
  end

end
