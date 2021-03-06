require 'rails_helper'

RSpec.describe BottlesController, type: :controller do
  describe "GET #index" do
    it "loads bottles into @bottles" do
      bottle1 = create(:bottle)
      bottle2 = create(:bottle)
      get :index
      expect(assigns(:bottles)).to match_array([bottle1, bottle2])
    end
  end
end
