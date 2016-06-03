Rails.application.routes.draw do

  root 'home#show'

  resources 'jobs', only: [:index, :show]

  resources 'events', only: [:index, :show]

  resources 'sessions', only: [:new, :create, :destroy]

  resources 'home', only: :show

  resources 'registrations', only: :new

  resources 'users', only: [:create, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
