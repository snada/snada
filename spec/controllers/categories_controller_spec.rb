require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #show" do
    it "assigns categorized posts as @posts" do
      fake = FactoryGirl.create(:post, category_list: 'fake')
      testing = FactoryGirl.create(:post, category_list: 'testing')

      get :show, {id: 'testing'}
      expect(assigns(:posts)).to eq([testing])
    end
  end
end
