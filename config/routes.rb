Rails.application.routes.draw do
  constraints ->(request){request.format == 'json' }do
    resources :expenses
    resources :employees do
      member do
        post :post_expenses
      end
    end
    resources :statuses
    resources :admins do
      member do
        get :search
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
