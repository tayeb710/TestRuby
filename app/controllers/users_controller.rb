class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    post_params = params.require(:user).permit(:user_id,:app)
    @user = User.new(post_params)
    @user.timestamp = Time.now.strftime("%Y%m%d")
    @user.save

    redirect_to controller: 'usersstats', action: 'show', id: @user.user_id
  end

end