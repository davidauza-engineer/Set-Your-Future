class UsersController < ApplicationController
  attr_reader :user

  def index
    redirect_to registrate_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/profile/#{@user.id}", notice: "Gracias por registrarte #{@user.username}"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
