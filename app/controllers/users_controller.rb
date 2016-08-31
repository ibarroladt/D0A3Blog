class UsersController < ApplicationController

  before_action :authenticate_admin!, except: [:new]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Usuario creado exitósamente"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Actualización exitosa"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario eliminado"
    redirect_to users_url
  end

  private

    def authenticate_admin!
      unless signed_in?
        flash[:alert] = 'Inicia sesión'
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

end
