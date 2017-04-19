Rails.application.routes.draw do
  get 'charges/create'

  devise_for :users

  resources :charges, only: [:new, :create, :delete]
  get '/charges', to: 'charges#delete', as: :downgrade

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
