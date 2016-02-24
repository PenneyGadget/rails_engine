require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to (:merchant) }

  it { should have_many (:invoice_items) }

  it { should have_many (:invoice) }

  it "converts cents to dollars" do
    item = Item.create(unit_price: 87468)

    expect(item.unit_price.to_f).to eq(874.68)
  end
end
