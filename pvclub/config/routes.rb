Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home' => 'pages#home'
  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
