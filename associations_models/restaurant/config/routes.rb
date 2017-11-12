Rails.application.routes.draw do

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
