Rails.application.routes.draw do

  resources :workers

  root 'worker#index'
end
