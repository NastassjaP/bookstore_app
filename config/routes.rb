Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :genres
  root 'books#index'
  resources:pages
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
