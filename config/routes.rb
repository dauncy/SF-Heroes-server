Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # routes for posting/getting/updating sf311 cases
  get '/community-events', to: 'community_event#index'
  post '/community-events', to: 'community_event#create'
  get '/community-events/:id', to: 'community_event#show'
  patch '/community-events/:id', to: 'community_event#update'

  # routes for posting/getting/updating/destroying users
  get '/users', to: 'user#index'
  post '/users', to: 'user#create'
  get '/users/:id', to: 'user#show'
  patch '/users/:id', to: 'user#update'
  delete '/users/:id', to: 'user#destroy'

  # routes for posting/getting user_events
  get '/commitments', to: 'user_event#index'
  post '/commitments', to: 'user_event#create'
  get '/commitments/:id', to: 'user_event#show'

  # get/post/destroy comments
  get '/comments', to: 'comment#index'
  post '/comments', to: 'comment#create'
  get '/comments/:id', to: 'comment#show'
  delete '/comments/:id', to: 'comment#destroy'

  # routes for authorization & authentication
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
