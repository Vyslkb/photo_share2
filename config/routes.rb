Rails.application.routes.draw do
  resources :users
  delete '/user-avatar/:id' => 'user_avatars#destroy', as: :user_avatar
  root to: 'home#index'
  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

end
