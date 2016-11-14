class UsersController < ApplicationController

  def update
    if current_user.update(user_params)
      flash[:notice] = "Profile was successfully updated!"
      redirect_to user_path(current_user)
    else
      render :action => :edit
    end
  end

  def posts
    @posts = current_user.posts
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :gender, :number)
  end

end
