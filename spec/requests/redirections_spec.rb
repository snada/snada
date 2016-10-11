require 'rails_helper'

describe "GET /login" do
  it "is reachable" do
    get "/login"
    expect(response).to redirect_to("/auth/github")
  end
end
