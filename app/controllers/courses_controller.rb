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
    redirect_to '/cohorts'
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)
    redirect_to '/cohorts'
  end

  def destroy
    @cohort = Cohort.find(params[:id]).destroy
    redirect_to '/cohorts'
  end

  private

  def cohort_params
    params.require(:owner).permit(:name, :start_date, :end_date, :course_id, :instructor_id)
  end
end
