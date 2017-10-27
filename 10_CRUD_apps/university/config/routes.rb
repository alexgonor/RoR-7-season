Rails.application.routes.draw do
  get 'student/name'

  resources :students

  get 'student/score'

  root 'student#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
