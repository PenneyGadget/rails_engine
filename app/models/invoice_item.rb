class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = (unit_price.to_i / 100.00).to_s
  end
end
