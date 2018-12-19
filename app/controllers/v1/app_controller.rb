module V1
  class AppController < ApplicationController

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



