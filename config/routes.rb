Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meetings, only: [:index] do
    collection do
      get :upcoming
    end
  end
  resources :meetings, only: %i[show new create destroy]

  get '/dashboard', to: 'users#dashboard', as: "dashboard"
end
