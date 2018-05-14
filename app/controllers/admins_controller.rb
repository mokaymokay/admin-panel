class AdminsController < ApplicationController

  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
    @admins = Admin.all
  end

  def show
    @admin
  end

  def new
    @admin = Admin.new
    @admin.build_user
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Admin '#{@admin.full_name}' created successfully."
    end
  end

  def edit
    @admin
  end

  def update
    if @admin.update(admin_params)
      flash[:alert] = "Admin '#{@admin.full_name}' updated successfully."
    end
  end

  def destroy
    @admin.destroy
    flash[:error] = "Admin '#{@admin.full_name}' destroyed successfully."
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(
      :first_name, :last_name, :age, :degree,
      user_attributes: [:email, :password]
    )
  end
end
