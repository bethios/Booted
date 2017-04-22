Rails.application.routes.draw do
  devise_for :users

  get '/charges', to: 'charges#delete', as: :downgrade

  resources :charges, only: [:new, :create, :delete]

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
