Rails.application.routes.draw do
  get 'jobs/index'

  get 'jobs/show'

  get 'events/index'

  get 'events/show'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  get 'registrations/new'

  get 'users/create'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
