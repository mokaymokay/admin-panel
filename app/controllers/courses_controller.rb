class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @course
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course '#{@course.name}' created successfully."
      redirect_to courses_path
    else
      render('new')
    end
  end

  def edit
    @course
  end

  def update
    if @course.update(course_params)
      flash[:alert] = "Course '#{@course.name}' updated successfully."
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    flash[:error] = "Course '#{@course.name}' destroyed successfully."
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :hours)
  end
end
