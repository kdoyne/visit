class UsersController < ApplicationController
before_action :load_user, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def destroy
    if @user = current_user || current_user.is_admin?
      session[:user_id] = nil
      @user.destroy
      redirect_to root_path
    else
      render nothing: true, status: 401
    end
  end

private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

