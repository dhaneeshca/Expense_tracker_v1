Rails.application.routes.draw do
  resources :admins
    constraints ->(request){request.format == 'json' }do
      resources :expenses
      resources :employees do
        member do
         post :post_expenses
        end
      end
      resources :statuses
    end
  # Defines the root path route ("/")
  # root "articles#index"
end
