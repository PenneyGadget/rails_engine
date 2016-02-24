require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to(:item) }

  it { should belong_to(:invoice) }

  it "converts cents to dollars" do
    invoice_item = InvoiceItem.create(unit_price: 87468)

    expect(invoice_item.unit_price).to eq("874.68")
  end
end
