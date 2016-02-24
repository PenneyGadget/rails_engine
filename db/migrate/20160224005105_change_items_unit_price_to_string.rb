class ChangeItemsUnitPriceToString < ActiveRecord::Migration
  def change
    change_column :items, :unit_price, :string
  end
end
