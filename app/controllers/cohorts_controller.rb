class CohortsController < ApplicationController
  # links to /courses/:course_id/cohorts route
  def index
    @cohorts = Cohort.where(course_id: params[:course_id])
  end

  # links to courses/:course_id/cohorts/:id route
  def show
    cohort = Cohort.find(params[:id])
    @students = cohort.students
    @instructor = cohort.instructor
  end

  def new
    @cohort = Cohort.new
    @course = Course.find(params[:course_id])
    @instructors = Instructor.all
  end

  def create
    Cohort.create(cohort_params)
    redirect_to course_cohorts_path(params[:course_id])
  end

  def edit
    @cohort = Cohort.find(params[:id])
    @course = Course.find(params[:course_id])
    @instructors = Instructor.all
  end

  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)
    redirect_to course_cohorts_path(params[:course_id])
  end

  def destroy
    @cohort = Cohort.find(params[:id]).destroy
    redirect_to course_cohorts_path(params[:course_id])
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  end
end
