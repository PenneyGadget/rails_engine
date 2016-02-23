require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to (:merchant) }

  it { should have_many (:invoice_items) }

  it { should have_many (:invoice) }

  xit "converts cents to dollars" do
    item = Item.create(unit_price: 87468)

    expect(item.convert_to_dollars).to eq(874.68)
  end
end
