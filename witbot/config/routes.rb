Rails.application.routes.draw do
  root 'chat#new_message'
  post '/new_message', to: 'chat_controller#new_message'
end
