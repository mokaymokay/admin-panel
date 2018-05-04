class CohortsController < ApplicationController
  # links to /courses/:course_id/cohorts route
  def index
    @cohorts = Cohort.where(course_id: params[:course_id])
  end

  # links to courses/:course_id/cohorts/:id route
  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @cohort = Cohort.new
    @course = Course.find(params[:course_id])
  end

  def create
    Cohort.create(cohort_params)
    # change link to nested
    redirect_to '/courses/1/cohorts/'
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)
    # change link to nested
    redirect_to '/cohorts'
  end

  def destroy
    @cohort = Cohort.find(params[:id]).destroy
    # change link to nested
    redirect_to '/cohorts'
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  end
end
