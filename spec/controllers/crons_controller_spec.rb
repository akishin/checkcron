require 'rails_helper'

RSpec.describe CronsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST check" do
    it "returns http success" do
      post :check, {format: :json}
      expect(response).to have_http_status(:success)
    end
  end

end
