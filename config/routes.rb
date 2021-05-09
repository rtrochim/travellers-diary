Rails.application.routes.draw do

  root 'notes#index'

  resources :notes

  resources :users do
    collection do
      get :login
    end
  end

end
