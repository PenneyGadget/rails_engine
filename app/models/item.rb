class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoice, through: :invoice_items

  before_save :convert_to_dollars

  default_scope { order('id ASC') }

  def convert_to_dollars
    self.unit_price = (unit_price.to_i / 100.0).to_s
  end
end
