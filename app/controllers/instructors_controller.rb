class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
    @instructor.build_profile
  end

  def create
    Instructor.create(instructor_params)
    redirect_to instructors_path
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    @instructor.update(instructor_params)
    redirect_to instructors_path
  end

  def destroy
    Instructor.find(params[:id]).destroy
    redirect_to instructors_path
  end

  private

  def instructor_params
    params.require(:instructor).permit(
      :first_name, :last_name, :age, :salary, :degree,
      profile_attributes: [
        :username,
        :password
      ]
    )
  end

end
