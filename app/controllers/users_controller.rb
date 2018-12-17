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
    puts("launched count")
    puts(ServiceJob.perform_later.calculLaunched(@user.user_id))
    puts("most launched app las 7 days")
    x = ServiceJob.perform_later.most_launched_app_last_7_days(@user.user_id)
    puts(x)
    puts("most active day last 7 days")
    y = ServiceJob.perform_later.most_active_day_last_7_days(@user.user_id)
    puts(y)
    puts("number of days active last 7 days")
    z = ServiceJob.perform_later.number_of_days_active_last_7_days(@user.user_id)
    puts(z)
    redirect_to controller: 'usersstats', action: 'test', user_id: @user.user_id
  end

end