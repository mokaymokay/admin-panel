class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :set_courses

  private

  def set_courses
    @courses = Course.all
  end

end
