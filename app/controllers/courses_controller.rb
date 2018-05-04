class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    Course.create(course_params)
    redirect_to '/courses'
  end

  def edit
    @course = course.find(params[:id])
  end

  def update
    @course = course.find(params[:id])
    @course.update(course_params)
    redirect_to '/courses'
  end

  def destroy
    @course = course.find(params[:id]).destroy
    redirect_to '/courses'
  end

  private

  def course_params
    params.require(:course).permit(:name, :hours)
  end
end
