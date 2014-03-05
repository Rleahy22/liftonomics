Liftonomics::Application.routes.draw do
  resources :users do
    resources :workouts
  end

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'users#new'
  match '/signout', to: 'sessions#destroy', via: 'delete'  
end
