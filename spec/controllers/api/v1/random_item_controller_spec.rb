require 'rails_helper'

RSpec.describe Api::V1::RandomItemController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a random item" do
      create_list(:item, 3)

      get :show, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
