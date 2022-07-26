Rails.application.routes.draw do

  root to:"homes#top"
  get '/home/about'=>"homes#about",as:'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users,only:[:show,:edit,:index,:update]
  resources :books,only:[:new,:show,:index,:create,:destroy,:edit,:update]
end
