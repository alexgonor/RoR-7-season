Rails.application.routes.draw do

  resources :engines

  root 'engines#index'
end
