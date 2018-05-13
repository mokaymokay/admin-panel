class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
    # won't need this if i use new.js.erb and change outerHTML to render partial
    @new_student = Student.new
  end

  def show
    @student
  end

  def new
    @student = Student.new
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Student '#{@student.full_name}' created successfully."
      # redirect_to students_path
    else
      flash[:error] = "Please try again."
      # render('new')
    end
  end

  # GET /students/:id/edit
  def edit
    @student
  end

  # POST /students/:id
  def update
    if @student.update(student_params)
      flash[:alert] = "Student '#{@student.full_name}' updated successfully."
      # redirect_to students_path
    else
      flash[:error] = "Please try again."
      # render 'edit'
    end
  end

  # POST /students/:id (delete method)
  def destroy
    @student.destroy
    flash[:error] = "Student '#{@student.full_name}' destroyed successfully."
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :degree)
  end
end
