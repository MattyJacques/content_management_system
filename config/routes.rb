Rails.application.routes.draw do

  root 'subjects#index'
 
  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

end
