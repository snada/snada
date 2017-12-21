require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  setup :activate_authlogic

  context 'Github login flow' do
    let(:user) { FactoryBot.create(:github_user) }

    describe 'POST create' do
      it 'should return 403 forbidden if not going trough omniauth' do |variable|
        post :create
        expect(response.status).to eq(403)
      end

      it 'should login existing github users and redirect to root' do
        controller.request.env['omniauth.auth'] = FactoryBot.create(:github_hash, uid: user.github_uid, nickname: user.nickname)
        post :create, params: { provider: :github }
        expect(response).to redirect_to(root_url)
      end

      it 'should create non-existing github users, log them in and redirect to root' do
        hash = FactoryBot.create(:github_hash)
        controller.request.env['omniauth.auth'] = hash

        expect(User.find_by(github_uid: hash.uid)).to be(nil)
        post :create, params: { provider: :github }
        expect(response).to redirect_to(root_url)
        expect(User.find_by(github_uid: hash.uid)).not_to be(nil)
      end

      it 'should create non-existing github users as normal users' do
        hash = FactoryBot.create(:github_hash)
        controller.request.env['omniauth.auth'] = hash

        expect(User.find_by(github_uid: hash.uid)).to be(nil)
        post :create, params: { provider: :github }
        expect(response).to redirect_to(root_url)
        expect(User.find_by(github_uid: hash.uid).normal?).to be true
      end
    end

    describe 'GET logout' do
      it 'should redirect to forbidden if user is not logged in' do
        get :destroy
        expect(response.status).to eq(403)
      end

      it 'should redirect to root if user is logged in' do
        UserSession.create(user)
        get :destroy
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
