class GradesController < ApplicationController

  before_action :set_grade, only: [:edit, :update]

  def index
  end

  def new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      flash[:success] = "Student successfully added to cohort."
      redirect_to course_cohort_path(@grade.cohort.course, @grade.cohort)
    else
      flash[:error] = "Cannot add student to cohort."
      redirect_to course_cohort_path(@grade.cohort.course, @grade.cohort)
    end
  end

  def edit
    @grade
  end

  def update
    if @grade.update(grade_params)
      flash[:alert] = "Grade for #{@grade.student.full_name} updated successfully."
      redirect_to course_cohort_path(@grade.cohort.course, @grade.cohort)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:cohort_id, :student_id, :pass)
  end

end
