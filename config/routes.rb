Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'merchant_finder#show'
      resources :merchants, only: [:index, :show]

      get '/customers/find', to: 'customer_finder#show'
      resources :customers, only: [:index, :show]

      get '/items/find', to: 'item_finder#show'
      resources :items, only: [:index, :show]

      get '/invoices/find', to: 'invoice_finder#show'
      resources :invoices, only: [:index, :show]

      get '/transactions/find', to: 'transaction_finder#show'
      resources :transactions, only: [:index, :show]

      get '/invoice_items/find', to: 'invoice_item_finder#show'
      resources :invoice_items, only: [:index, :show]
    end
  end
end
