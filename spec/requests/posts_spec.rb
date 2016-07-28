require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "is reachable" do
      get posts_path
      expect(response).to have_http_status(200)
    end

    pending "reminder that once user permissions are set up, need to test for statuses accordingly"
  end
end
