Rails.application.routes.draw do

  resources :flights do
    resources :planes do
      resources :countries
    end
  end

  root 'flights#index'
end
