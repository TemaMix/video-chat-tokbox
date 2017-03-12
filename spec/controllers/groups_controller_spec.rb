require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    before { allow(VideoOpenTok).to receive(:create_session_id).and_return('test string') }

    it "returns http success" do
      get :create, new_group: {name: 'test'}
      expect(response).to  redirect_to(group_path(assigns(:new_group)))
    end
  end

  describe "GET #show" do

    subject(:group) { create :group }

    it "returns http success" do
      get :show, id: group.id
      expect(response).to have_http_status(:success)
    end
  end

end
