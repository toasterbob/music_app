class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      redirect_to new_user_url
    end
  end

  def show
    # if current_user.id == params[:id].to_i
      @user = current_user
      render :show
    # else
    #   redirect_to new_user_url
    # end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
