Rails.application.routes.draw do
  root 'workouts#index'
  devise_for :users

  resources :workouts do
    resources :days, except: %i[index] do
      resources :exercises, except: %i[index show] do
        resources :exercise_sets, except: %i[index show]
      end
    end

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end

  resources :workouts do
    resources :days, except: %i[index] do
      resources :history_days do
        resources :history_exercises do
          resources :history_sets
        end
      end
    end
  end

  resources :history_days do
    resources :history_exercises do
      resources :history_sets
    end
  end
end
