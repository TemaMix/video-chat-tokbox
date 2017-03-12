Rails.application.routes.draw do
  root 'groups#index'

  resources :groups, except: [:destroy, :update]
end
