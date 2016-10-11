require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #index' do
    it 'assigns last 3 posts as @posts' do
      posts = [
        FactoryGirl.create(:post),
        FactoryGirl.create(:post),
        FactoryGirl.create(:post),
        FactoryGirl.create(:post)
      ].reverse

      get :index, {}
      expect(assigns(:posts)).to eq(posts.first(3))
    end
  end

  describe 'GET #about' do
    it 'assigns the first user as @snada' do
      FactoryGirl.create(:user)

      get :about, {}
      expect(assigns(:snada)).to eq(User.first)
    end
  end
end
