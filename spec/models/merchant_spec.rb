require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many (:items) }

  it { should have_many (:invoices) }

  it { should have_many (:transactions) }
end
