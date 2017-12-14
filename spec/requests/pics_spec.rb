require 'rails_helper'

RSpec.describe "Pics", type: :request do
  setup :activate_authlogic

  after(:each) do
    UserSession.find.destroy if UserSession.find
  end

  describe "GET /pics" do
    context "as guest user" do
      it "is not reachable" do
        get pics_path
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is not reachable" do
        UserSession.create(FactoryGirl.create(:github_user))
        get pics_path
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:admin_user))
        get pics_path
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /pic" do
    let(:pic) {
      FactoryGirl.create(:pic)
    }

    context "as guest user" do
      it "is not reachable" do
        get pic_path pic
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is not reachable" do
        UserSession.create(FactoryGirl.create(:github_user))
        get pic_path pic
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:admin_user))
        get pic_path pic
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST /pics" do
    context "as guest user" do
      it "is not reachable" do
        post pics_path(pic: { upload: '' })
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is not reachable" do
        UserSession.create(FactoryGirl.create(:github_user))
        post pics_path(pic: { upload: '' })
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:admin_user))
        post pics_path(pic: { upload: '' })
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "EDIT /pic" do
    let(:valid_pic) {
      FactoryGirl.create(:pic)
    }

    context "as guest user" do
      it "is not reachable" do
        get edit_pic_path valid_pic
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is not reachable" do
        UserSession.create(FactoryGirl.create(:github_user))
        get edit_pic_path valid_pic
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:admin_user))
        get edit_pic_path valid_pic
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PUT /pic" do
    let(:valid_pic) {
      FactoryGirl.create(:pic)
    }

    let(:valid_attributes) {
      { upload: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/cat.jpg", "image/jpeg") }
    }

    context "as guest user" do
      it "is not reachable" do
        patch pic_path valid_pic, pic: valid_attributes
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is not reachable" do
        UserSession.create(FactoryGirl.create(:github_user))
        patch pic_path valid_pic, pic: valid_attributes
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:admin_user))
        patch pic_path(valid_pic), params: { pic: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE /pic" do
    let(:valid_pic) {
      FactoryGirl.create(:pic)
    }

    context "as guest user" do
      it "is reachable" do
        delete pic_path valid_pic
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as normal user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:github_user))
        delete pic_path valid_pic
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "is reachable" do
        UserSession.create(FactoryGirl.create(:admin_user))
        delete pic_path valid_pic
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
