Rails.application.routes.draw do
  get 'charges/create'

  devise_for :users

  resources :charges, only: [:new, :create]

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
