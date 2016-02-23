class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :credit_card_number
      t.string :result
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
