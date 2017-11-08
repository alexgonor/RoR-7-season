Rails.application.routes.draw do

  resources :flights do
    resources :planes do
      resources :countries do
        resources :sities
      end
    end
  end

  root 'flights#index'
end
