class CohortsController < ApplicationController
  # links to /cohorts route
  def index
    @cohorts = Cohort.all
  end

  # links to /cohorts/:id route
  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @cohort = Cohort.new
  end

  def create
    Cohort.create(cohort_params)
    # change link to nested
    redirect_to '/cohorts'
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
    params.require(:owner).permit(:name, :start_date, :end_date, :course_id, :instructor_id)
  end
end
