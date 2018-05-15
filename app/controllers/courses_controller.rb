class CoursesController < ApplicationController

  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course '#{@course.name}' created successfully."
      respond_to { |format|
        format.html { redirect_to courses_path }
        format.js
      }
    end
  end

  def edit
    @course
  end

  def update
    if @course.update(course_params)
      flash[:alert] = "Course '#{@course.name}' updated successfully."
    end
  end

  def destroy
    @course.destroy
    flash[:error] = "Course '#{@course.name}' destroyed successfully."
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :hours)
  end
end
