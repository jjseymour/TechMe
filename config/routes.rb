Rails.application.routes.draw do

  root 'home#show'

  resources 'jobs', only: [:index, :show]

  resources 'events', only: [:index, :show]

  resources 'sessions', only: :create
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'

  get "/auth/:provider/callback" => "sessions#google_auth"

  resources 'home', only: :show

  get 'signup', to: 'registrations#new', as: 'new_registration'

  resources 'users', only: [:create, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
