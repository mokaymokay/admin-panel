class CohortsController < ApplicationController

  before_action :set_course, only: [:index, :show, :new, :edit]
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]
  before_action :set_instructors, only: [:new, :edit]

  # links to /courses/:course_id/cohorts route
  def index
    @course
    @cohorts = Cohort.where(course_id: params[:course_id])
  end

  # links to courses/:course_id/cohorts/:id route
  def show
    @cohort
    @course
    @grade = Grade.new
    @students = @cohort.students
    @students_not_in_cohort = Student.joins('LEFT OUTER JOIN grades ON grades.student_id = students.id').where.not(id: Grade.where(cohort_id: @cohort.id).pluck(:student_id)).distinct
    @instructor = @cohort.instructor
  end

  def new
    @course
    @cohort = Cohort.new
    @instructors
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      flash[:success] = "Cohort '#{@cohort.name}' created successfully."
      respond_to { |format|
        format.html { redirect_to course_cohorts_path(params[:course_id]) }
        format.js
      }
    end
  end

  def edit
    @cohort
    @course
    @instructors
  end

  def update
    if @cohort.update(cohort_params)
      flash[:alert] = "Cohort '#{@cohort.name}' updated successfully."
      # redirect_to course_cohorts_path(params[:course_id])
    end
  end

  def destroy
    @cohort.destroy
    flash[:error] = "Cohort '#{@cohort.name}' destroyed successfully."
    # redirect_to course_cohorts_path(params[:course_id])
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  def set_instructors
    @instructors = Instructor.all
  end

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  end

end
