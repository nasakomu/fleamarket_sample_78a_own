Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :profieles
  resources :destinations
  root 'items#top'
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'top'
      get 'payment_method'
      get 'thanks'
    end
    member do
      get 'buy'
      post 'pay'
    end
  end
  resources :credit_cards, only: [:create, :new, :show, :destroy] do
    collection do
      get 'redirect_back'
    end
  end
  resources :categories, only: [:index, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end
end
