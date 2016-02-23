require 'csv'

task :import => :environment do
  CSV.foreach("lib/assets/customers.csv", headers: true) do |row|
    Customer.create!(row.to_h)
  end
  puts "Customers created!"

  CSV.foreach("lib/assets/merchants.csv", headers: true) do |row|
    Merchant.create!(row.to_h)
  end
  puts "Merchants created!"

  CSV.foreach("lib/assets/items.csv", headers: true) do |row|
    Item.create!(row.to_h)
  end
  puts "Items created!"

  CSV.foreach("lib/assets/invoices.csv", headers: true) do |row|
    Invoice.create!(row.to_h)
  end
  puts "Invoices created!"

  CSV.foreach("lib/assets/invoice_items.csv", headers: true) do |row|
    InvoiceItem.create!(row.to_h)
  end
  puts "Invoices items created!"

  CSV.foreach("lib/assets/transactions.csv", headers: true) do |row|
    Transaction.create!({id:                 row[:id],
                         invoice_id:         row[:invoice_id],
                         credit_card_number: row[:credit_card_number],
                         result:             row[:result],
                         created_at:         row[:created_at],
                         updated_at:         row[:updated_at]})
  end
  puts "Transactions created!"
end
