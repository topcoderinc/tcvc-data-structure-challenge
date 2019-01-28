require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  include Devise::TestHelpers

  describe "GET index" do
    let(:user) { User.create!(email: "user@bloccit.com", password: "helloworld") }
    let (:houses) { House.create!(address: 'Levittown', cost: '400000', period: '30', down_payment: '100000',
                    interest: 4, taxes: '0', payment: '1432.25') }

    before do
      sign_in user
      post :index, houses: houses
    end

    it "renders the index template" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
