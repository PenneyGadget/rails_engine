class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = self.unit_price / 100.0
  end
end
