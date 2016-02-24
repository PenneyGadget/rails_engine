class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price, precision: 8, scale: 2
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
