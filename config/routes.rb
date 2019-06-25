Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  def after_sign_up_path_for(resource)
  return "/pages"
  end
  resources :books
  resources :genres
  root 'books#index'
  resources:pages
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
