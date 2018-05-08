class CohortsController < ApplicationController

  before_action :set_course, only: [:index, :show, :new, :edit]
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  # links to /courses/:course_id/cohorts route
  def index
    @course
    @cohorts = Cohort.where(course_id: params[:course_id])
  end

  # links to courses/:course_id/cohorts/:id route
  def show
    @cohort
    @course
    @students = @cohort.students
    @instructor = @cohort.instructor
  end

  def new
    @course
    @cohort = Cohort.new
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
    @cohort
    @course
    @instructors = Instructor.all
  end

  def update
    @cohort
    if @cohort.update(cohort_params)
    flash[:alert] = "Cohort #{@cohort.name} updated successfully."
    redirect_to course_cohorts_path(params[:course_id])
    else
      render 'edit'
    end
  end

  def destroy
    @cohort.destroy
    flash[:error] = "Cohort #{@cohort.name} destroyed successfully."
    redirect_to course_cohorts_path(params[:course_id])
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  end

end
