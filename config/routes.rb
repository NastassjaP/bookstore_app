Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" } do
    resources :reviews
  end

  resources :books do
    resources :reviews
  end
  resources :reviews do
    resources :reviews
  end

  def after_sign_up_path_for(resource)
    return "/pages"
  end

  post 'purchase', to: 'book_purchases#create'
  resources :genres
  root 'books#index'
  resources :pages
  post '/reviews', to: 'reviews#create'



  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
