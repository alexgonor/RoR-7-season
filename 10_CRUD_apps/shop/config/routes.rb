Rails.application.routes.draw do

  resources :items

  root 'item#index'
end
