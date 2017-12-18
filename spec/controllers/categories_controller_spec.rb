require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #show" do
    it "assigns categorized posts as @posts" do
      fake = FactoryBot.create(:post, category_list: 'fake')
      testing = FactoryBot.create(:post, category_list: 'testing')

      get :show, params: {id: 'testing'}
      expect(assigns(:posts)).to eq([testing])
    end
  end
end
