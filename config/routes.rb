Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'merchant_finder#show'
      get '/merchants/find_all', to: 'merchant_finder#index'
      get '/merchants/random', to: 'random_merchant#show'

      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
        get '/revenue', to: 'merchants/revenues#show'
      end

      get '/customers/find', to: 'customer_finder#show'
      get '/customers/find_all', to: 'customer_finder#index'
      get '/customers/random', to: 'random_customer#show'

      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'customers/invoices#index'
        get '/transactions', to: 'customers/transactions#index'
      end

      get '/items/find', to: 'item_finder#show'
      get '/items/find_all', to: 'item_finder#index'
      get '/items/random', to: 'random_item#show'
      get '/items/most_items', to: 'items/most_items#index'

      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant', to: 'items/merchants#show'
      end

      get '/invoices/find', to: 'invoice_finder#show'
      get '/invoices/find_all', to: 'invoice_finder#index'
      get '/invoices/random', to: 'random_invoice#show'

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customers#show'
        get '/merchant', to: 'invoices/merchants#show'
      end

      get '/transactions/find', to: 'transaction_finder#show'
      get '/transactions/find_all', to: 'transaction_finder#index'
      get '/transactions/random', to: 'random_transaction#show'

      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions/invoices#show'
      end

      get '/invoice_items/find', to: 'invoice_item_finder#show'
      get '/invoice_items/find_all', to: 'invoice_item_finder#index'
      get '/invoice_items/random', to: 'random_invoice_item#show'

      resources :invoice_items, only: [:index, :show] do
        get '/invoice', to: 'invoice_items/invoices#show'
        get '/item', to: 'invoice_items/items#show'
      end
    end
  end
end
