Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasks

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: 'tasks#index'
end
