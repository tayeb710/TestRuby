module Api
  module V1
    class WebserviceController < ApplicationController

      def test
        userstat = UserStat.new
        userstat.user_id = params[:user_id]
        userstat.app_launched = ServiceJob.perform_later.calculLaunched(params[:user_id])
        userstat.most_launched_app_last_7_days = ServiceJob.perform_later.most_launched_app_last_7_days(params[:user_id])
        userstat.most_active_day_last_7_days = ServiceJob.perform_later.most_active_day_last_7_days(params[:user_id])
        userstat.number_of_days_active_last_7_day = ServiceJob.perform_later.number_of_days_active_last_7_days(params[:user_id])
        render json: {status: 'SUCCESS', message:'User Behaviour', data:userstat},status: :ok
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: {status: 'SUCCESS', message:'User Ajouté', data:user},status: :ok
        else
          render json: {status: 'ERROR', message:'Erreur', data:user.errors},status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:user_id,:app,:timestamp)
      end
    end
  end
end