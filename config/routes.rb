Rails.application.routes.draw do
  resources :admins
    constraints ->(request){request.format == 'json' }do
      resources :expenses do
        member do
          get :arrive
        end
      end
      resources :employees
      resources :statuses
    end
  # Defines the root path route ("/")
  # root "articles#index"
end
