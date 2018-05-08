class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    @student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      flash[:success] = "Student '#{@student.full_name}' created successfully."
      redirect_to students_path
    else
      render('new')
    end
  end

  def edit
    @student
  end

  def update
    if @student.update(student_params)
      flash[:alert] = "Student '#{@student.full_name}' updated successfully."
      redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:error] = "Student '#{@student.full_name}' destroyed successfully."
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :degree)
  end
end
