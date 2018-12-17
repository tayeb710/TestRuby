class UsersstatsController < ApplicationController

  def test
    @userstat = UserStat.new
    @userstat.user_id = params[:user_id]
    @userstat.app_launched = ServiceJob.perform_later.calculLaunched(params[:user_id])
    @userstat.most_launched_app_last_7_days = ServiceJob.perform_later.most_launched_app_last_7_days(params[:user_id])
    @userstat.most_active_day_last_7_days = ServiceJob.perform_later.most_active_day_last_7_days(params[:user_id])
    @userstat.number_of_days_active_last_7_day = ServiceJob.perform_later.number_of_days_active_last_7_days(params[:user_id])
  end

end
