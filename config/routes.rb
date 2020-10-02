Rails.application.routes.draw do
  root 'items#top'
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'top'
    end
  end
  # userコントローラに配置する
  # get 'putting_up_list', on: :show
  # get 'complicated_item', on: :show
  # get 'profile', on: :edit
  # get 'destination', on: :edit
  # get 'payment_method', on: :edit
  resources :categories, only: [:index, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
