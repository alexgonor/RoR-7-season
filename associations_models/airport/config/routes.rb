Rails.application.routes.draw do
  devise_for :models
  resources :flights do
    resources :planes do
      resources :countries do
        resources :sities
      end
    end
  end

  root 'flights#index'
end
