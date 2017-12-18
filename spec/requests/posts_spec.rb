require 'rails_helper'

RSpec.describe "Posts", type: :request do
  setup :activate_authlogic

  after(:each) do
    UserSession.find.destroy if UserSession.find
  end

  describe "GET /posts" do
    context "as guest user" do
      it "is reachable" do
        get posts_path
        expect(response).to have_http_status(200)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:github_user))
        get posts_path
        expect(response).to have_http_status(200)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:admin_user))
        get posts_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /post" do
    let(:valid_post) {
      FactoryBot.create(:post)
    }

    context "as guest user" do
      it "is reachable" do
        get post_path valid_post
        expect(response).to have_http_status(200)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:github_user))
        get post_path valid_post
        expect(response).to have_http_status(200)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:admin_user))
        get post_path valid_post
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /posts" do
    let(:valid_attributes) {
      { title: 'title', description: 'description', body: 'body', category_list: 'category1, category2' }
    }

    context "as guest user" do
      it "is reachable" do
        post posts_path post: valid_attributes
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:github_user))
        post posts_path post: valid_attributes
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:admin_user))
        post posts_path post: valid_attributes
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "EDIT /post" do
    let(:valid_post) {
      FactoryBot.create(:post)
    }

    context "as guest user" do
      it "is reachable" do
        get edit_post_path valid_post
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:github_user))
        get edit_post_path valid_post
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:admin_user))
        get edit_post_path valid_post
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PUT /post" do
    let(:valid_post) {
      FactoryBot.create(:post)
    }

    let(:valid_attributes) {
      { title: 'title', description: 'description', body: 'body', category_list: 'category1, category2' }
    }

    context "as guest user" do
      it "is reachable" do
        patch post_path valid_post, { post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:github_user))
        patch post_path valid_post, { post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:admin_user))
        patch post_path valid_post, { post: valid_attributes }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE /post" do
    let(:valid_post) {
      FactoryBot.create(:post)
    }

    context "as guest user" do
      it "is reachable" do
        delete post_path valid_post
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:github_user))
        delete post_path valid_post
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryBot.create(:admin_user))
        delete post_path valid_post
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
