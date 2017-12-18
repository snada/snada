require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /category/blog" do
    it "is reachable if category does exists" do
      FactoryBot.create(:post, category_list: 'exist')

      get category_path('exist')
      expect(response).to have_http_status(200)
    end

    it "it is not reachable if category does not exists" do
      FactoryBot.create(:post, category_list: 'exist')

      get category_path('not_exist')
      expect(response).to have_http_status(404)
    end
  end
end
