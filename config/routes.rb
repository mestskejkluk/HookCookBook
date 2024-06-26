Rails.application.routes.draw do
  resources :ingredients_steps do
    resources :ingredients, only: [:new, :create, :destroy, :update]
  end
  get "home/index"
  resources :comments
  resources :ingredients
  resources :steps do
    resources :ingredients_steps, only: [:new, :create, :destroy, :update]
    resources :ingredients, only: [:new, :create, :destroy, :update]
  end
  resources :recipes do
    resources :comments, only: [:create, :destroy]
    resources :steps, only: [:new, :create, :destroy, :update]
    member do
      get 'start_cooking'
      get 'cook_step/:step_id', to: 'recipes#cook_step', as: 'cook_step'
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
