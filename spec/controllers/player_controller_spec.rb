require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
    context "GET #index" do
        it "returns a success response" do
            get :index
            # expect(response.success).to eq(true)
            expect(response).to have_http_status(:success)
        end
    
    end

    context "GET #show" do
        let(:player) {Player.create(name: 'test_show')} # create when firstly call
        # let!(:player) {Player.create(name: 'test_show')} # create now


        it "returns  a success response" do
            get :show, params: {id: player}
            expect(response).to have_http_status(:success)
        end
    end
end