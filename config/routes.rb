Rails.application.routes.draw do
  # constraints ->(request){request.format == 'json' }do
    resources :expenses do
      member do
        post :upload_image
    end
  end
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
    resources :comments do
      member do
        get :search
      end
    end
  # end
  # Defines the root path route ("/")
  # root "articles#index"
end
