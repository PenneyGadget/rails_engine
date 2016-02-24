class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.decimal :unit_price, precision: 8, scale: 2
      t.references :item, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
