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
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course #{@course.name} created successfully."
      redirect_to courses_path
    else
      render('new')
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:notice] = "Course #{@course.name} updated successfully."
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id]).destroy
    flash[:error] = "Course #{@course.name} destroyed successfully."
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :hours)
  end
end
