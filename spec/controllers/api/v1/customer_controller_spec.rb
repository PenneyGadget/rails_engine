require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  def create_customers(num)
    num.times do |n|
      Customer.create(first_name: "First Name #{n}",
                       last_name: "Last Name #{n}")
    end
  end

  describe "GET #index" do
    it "returns all customers in json format" do
      create_customers(3)

      get :index, format: :json

      expect(response.body).to eq(Customer.all.to_json)
      expect(Customer.all.count).to eq(3)
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "returns customer with specified id in json" do
      customer = Customer.create(first_name: "Penney",
                                 last_name: "Gadget")

      get :show, id: customer.id, format: :json

      expect(response.body).to eq(Customer.find(customer.id).to_json)
      expect(response.status).to eq(200)
    end
  end
end
