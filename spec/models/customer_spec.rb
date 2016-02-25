require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:invoices) }

  it { should have_many(:transactions) }

  it { should have_many(:merchants) }
end
