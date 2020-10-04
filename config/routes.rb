Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :profieles
  resources :destinations
  root 'items#top'
  resources :items, only: [:index, :new, :create] do
    collection do
      get 'top'
      get 'buy'
      get 'payment_method'
    end
  end
  resources :credit_cards, only: [:create, :new, :show, :destroy]
  resources :categories, only: [:index, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
