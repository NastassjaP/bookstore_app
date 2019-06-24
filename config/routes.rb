Rails.application.routes.draw do
 devise_for :users
 resources :books
 resources :genres

 devise_scope :user do
   authenticated :user do
    root 'pages#home', as: :authenticated_root
   end

   unauthenticated do
     root 'devise/sessions#new', as: :unauthenticated_root
   end
  end

mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
