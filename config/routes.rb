Rails.application.routes.draw do
  root 'workouts#index'
  devise_for :users
  resources :workouts

  resources :workouts do
    resources :days, except: %i[index] do
      resources :exercises, except: %i[index]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
