Rails.application.routes.draw do
  root 'items#top'
  resources :items, only: [:index, :new] do
    collection do
      get 'top'
      get 'buy'
      get 'payment_method'
    end
  end
  resources :credit_cards, only: [:create, :new, :show, :destroy]
end
