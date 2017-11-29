Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :cooks do
    resources :waiters do
      resources :visitors do
        resource :menu do
          resources :dishes
        end
      end
    end
  end

  root 'cooks#index'
end
