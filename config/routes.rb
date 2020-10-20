Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :profieles
  resources :destinations

  devise_scope :user do
    get '/users/show', to: 'users/sessions#show'
    get '/users/edit_info', to: 'users/sessions#edit_info'
    get '/users/putting_up_list', to: 'users/sessions#putting_up_list'
    get '/users/completed_item', to: 'users/sessions#completed_item'
    get '/users/profile', to: 'users/sessions#profile'
    get '/users/destination', to: 'users/sessions#destination'
    get '/users/payment_method', to: 'users/sessions#payment_method'
    get '/users/logout', to: 'users/sessions#logout'
  end

  root 'items#top'
  resources :items, only: [:new, :create, :show, :destroy] do
    collection do
      get 'top'
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
