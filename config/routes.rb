Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :airlines, only: [:show]

  resources :flights,  only: [:index] do
    delete '/passengers/:id', to: 'flight_passengers#destroy', as: 'passenger'
  end
end
