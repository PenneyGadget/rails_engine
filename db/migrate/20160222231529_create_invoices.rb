class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :status
      t.references :customer, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
