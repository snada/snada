require 'rails_helper'

RSpec.describe "Application", type: :request do
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
end
