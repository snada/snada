require 'rails_helper'

describe "GET /login" do
  it "is reachable" do
    get "/login"
    expect(response).to have_http_status :ok
  end
end
