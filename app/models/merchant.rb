class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customer, through: :invoices
end
