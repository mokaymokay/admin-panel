class InstructorsController < ApplicationController

  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor
  end

  def new
    @instructor = Instructor.new
    @instructor.build_user
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor '#{@instructor.full_name}' created successfully."
      respond_to { |format|
        format.html { redirect_to instructors_path }
        format.js
      }
    # else
      # flash[:error] = @instructor.errors.full_messages.first
    end
  end

  def edit
    @instructor
  end

  def update
    if @instructor.update(instructor_params)
      flash[:alert] = "Instructor '#{@instructor.full_name}' updated successfully."
    end
  end

  def destroy
    @instructor.destroy
    flash[:error] = "Instructor '#{@instructor.full_name}' destroyed successfully."
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(
      :first_name, :last_name, :age, :salary, :degree,
      user_attributes: [:email, :password]
    )
  end

end
