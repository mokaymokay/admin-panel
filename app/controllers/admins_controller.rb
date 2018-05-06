class AdminsController < ApplicationController
  def index
    @admins = admin.all
  end

  def show
    @admin = admin.find(params[:id])
  end

  def new
    @admin = admin.new
    @admin.build_profile
  end

  def create
    admin.create(admin_params)
    redirect_to admins_path
  end

  def edit
    @admin = admin.find(params[:id])
  end

  def update
    @admin = admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to admins_path
  end

  def destroy
    admin.find(params[:id]).destroy
    redirect_to admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(
      :first_name, :last_name, :age, :degree,
      profile_attributes: [
        :username,
        :password
      ]
    )
  end
end
