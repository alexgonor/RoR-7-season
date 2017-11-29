Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]
  end

  resources :users, except: [:destroy, :index]
end
