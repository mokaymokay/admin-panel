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
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      flash[:success] = "Cohort #{@cohort.name} created successfully."
      redirect_to course_cohorts_path(params[:course_id])
    else
      render('new')
    end
  end

  def edit
    @cohort = Cohort.find(params[:id])
    @course = Course.find(params[:course_id])
    @instructors = Instructor.all
  end

  def update
    @cohort = Cohort.find(params[:id])
    if @cohort.update(cohort_params)
    flash[:notice] = "Cohort #{@cohort.name} updated successfully."
    redirect_to course_cohorts_path(params[:course_id])
    else
      render 'edit'
    end
  end

  def destroy
    @cohort = Cohort.find(params[:id]).destroy
    flash[:error] = "Cohort #{@cohort.name} destroyed successfully."
    redirect_to course_cohorts_path(params[:course_id])
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  end
end
