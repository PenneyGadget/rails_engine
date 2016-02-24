class ChangeInvoiceItemsUnitPriceToString < ActiveRecord::Migration
  def change
    change_column :invoice_items, :unit_price, :string
  end
end
