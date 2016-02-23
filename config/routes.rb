Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :merchants, only: [:index, :show]

      get '/customers/find', to: 'customer_finder#show'
      resources :customers, only: [:index, :show]

      resources :items, only: [:index, :show]

      resources :invoices, only: [:index, :show]

      resources :transactions, only: [:index, :show]

      resources :invoice_items, only: [:index, :show]
    end
  end
end
