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
    @instructor.build_profile
  end

  def create
    @instructor = Instructor.create(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor '#{@instructor.full_name}' created successfully."
      redirect_to instructors_path
    else
      render('new')
    end
  end

  def edit
    @instructor
  end

  def update
    if @instructor.update(instructor_params)
      flash[:alert] = "Instructor '#{@instructor.full_name}' updated successfully."
      redirect_to instructors_path
    else
      render 'edit'
    end
  end

  def destroy
    @instructor.destroy
    flash[:error] = "Instructor '#{@instructor.full_name}' destroyed successfully."
    redirect_to instructors_path
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(
      :first_name, :last_name, :age, :salary, :degree,
      profile_attributes: [:username, :password]
    )
  end

end
