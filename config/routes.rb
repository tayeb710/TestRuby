Rails.application.routes.draw do


  namespace 'v1' do
      resources :app

  end

  namespace 'v1' do
    resources :user
    get '/:id',to:'user#show',as: 'show'
  end


  resources :users
  resources :usersstats



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
