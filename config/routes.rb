Rails.application.routes.draw do

root 'questions#index'

 resources :users, except: [:new, :destroy]

 resources :questions

 resources :answers, except: [:index, :show, :destroy]

 resources :comments, except: [:index, :show, :destroy]

 resources :tags, only: [:index, :show]

 resources :votes, only: [:create, :new]


 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/signup' => 'users#new'
 get '/logout' => 'sessions#destroy'
 post '/find_user' => 'users#find_user'


end
