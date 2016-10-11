require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts/new" do
    it 'is always reachable' do
      get '/contacts/new'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /posts" do
    let(:valid_attributes) {
      { subject: 'Subject', from: 'test@spec.com', body: 'body' }
    }

    it "is reachable" do
      post contacts_path contact: valid_attributes
      expect(response).to have_http_status(:redirect)
    end
  end
end
