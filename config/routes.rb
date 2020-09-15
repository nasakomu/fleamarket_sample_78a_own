Rails.application.routes.draw do
  root 'items#top'
  resources :items, only: :index do
    collection do
      get 'top'
    end
  end
  resources :categories, only: [:index, :show]
end
