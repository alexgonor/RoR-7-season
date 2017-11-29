Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:destroy, :index]

  get "/admin" => "admin/users#index"
  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]
  end

  root 'welcome#index'
end
