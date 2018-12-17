Rails.application.routes.draw do


  namespace 'api' do
    namespace 'v1' do
      resources :webservice
      get '/test/:user_id',to:'webservice#test',as: 'test'
    end
  end

  resources :users
  resources :usersstats


  get '/test/:user_id',to:'usersstats#test',as: 'test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
