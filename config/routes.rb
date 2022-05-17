Rails.application.routes.draw do
  resources :comments
  constraints ->(request){request.format == 'json' }do
    resources :expenses
    resources :employees do
      member do
        post :post_expenses
        post :add_comment
      end
    end
    resources :statuses
    resources :admins do
      member do
        get :search
        post :add_comment
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
