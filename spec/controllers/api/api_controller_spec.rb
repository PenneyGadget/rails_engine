require "rails_helper"

RSpec.describe Api::ApiController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "works" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
