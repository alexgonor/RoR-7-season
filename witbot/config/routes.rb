Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'omniauth#create'

  resources :users do
    resources :messages
  end
end
