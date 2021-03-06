Rails.application.routes.draw do
  root 'questions#index'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/search', to: 'questions#search'
  get '/signup', to: 'users#new'

  get '/unanswered', to: 'questions#unanswered', as: 'unanswered'

  post 'votes/upvote', to: 'votes#upvote'
  post 'votes/downvote', to: 'votes#downvote'

  resources :users
  resources :comments, only: [:create, :edit, :destroy, :update]
  resources :questions do
    resources :answers
  end
end