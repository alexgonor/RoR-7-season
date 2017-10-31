Rails.application.routes.draw do

  resources :solders

  root 'solders#index'
end
