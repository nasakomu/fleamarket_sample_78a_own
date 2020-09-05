Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :index do
    collection do
      get 'top'
    end
  end
end
