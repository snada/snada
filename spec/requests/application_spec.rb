require 'rails_helper'

RSpec.describe "Application", type: :request do
  setup :activate_authlogic

  after(:each) do
    UserSession.find.destroy if UserSession.find
  end

  describe "GET /" do
    it 'is always reachable' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /about" do
    it 'is always reachable' do
      get '/about'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /login' do
    let(:user) { FactoryBot.create(:github_user) }

    it 'is reachable when logged out' do
      get '/login'
      expect(response).to have_http_status(200)
    end
    
    it 'should not be reachable when logged in' do
      UserSession.create(user)
      get '/login'
      expect(response).to have_http_status(:forbidden)
    end
  end
end
