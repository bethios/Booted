Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get '/charges', to: 'charges#delete', as: :downgrade

  resources :charges, only: [:new, :create, :delete]

  resources :wikis do
    resources :collaborators
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
