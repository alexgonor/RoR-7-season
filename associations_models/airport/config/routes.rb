Rails.application.routes.draw do
  devise_for :models
  resources :flights, except: :destroy do
    resources :planes, except: :destroy do
      resources :countries, except: :destroy do
        resources :sities, except: :destroy
      end
    end
  end

  get "/admin" => "admin/flights#index"
  namespace :admin do
    resources :flights do
      resources :planes do
        resources :countries do
          resources :sities
        end
      end
    end
  end

  root 'flights#index'
end
