require 'rails_helper'

RSpec.describe PicsController, type: :controller do
  setup :activate_authlogic

  after(:each) do
    UserSession.find.destroy if UserSession.find
  end

  let(:valid_pic) {
    FactoryBot.create(:pic)
  }

  let(:valid_attributes) {
    { upload: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/cat.jpg", "image/jpeg") }
  }

  let(:invalid_attributes) {
    { upload: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/fake.txt", "text/plain") }
  }

  describe "GET #index" do
    context 'as guest user' do
      it 'should be forbidden' do
        get :index
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as a normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryBot.create(:github_user))
        get :index
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      before(:each) do
        UserSession.create(FactoryBot.create(:admin_user))
      end

      it "assigns all pics as @pics" do
        get :index
        expect(assigns(:pics)).to eq(Pic.all)
      end
    end
  end

  describe "GET #show" do
    context "as guest user" do
      it "should be forbidden" do
        get :show, params: { id: valid_pic.to_param }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as a normal user" do
      it "should be forbidden" do
        UserSession.create(FactoryBot.create(:github_user))
        get :show, params: { id: valid_pic.to_param }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as admin user" do
      it "assigns the pic as @pic" do
        UserSession.create(FactoryBot.create(:admin_user))
        get :show, params: { id: valid_pic.to_param }
        expect(assigns(:pic)).to eq(valid_pic)
      end
    end
  end

  describe "GET #new" do
    context "as a guest user" do
      it "should be forbidden" do
        get :new
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as a normal user" do
      it "should be forbidden" do
        UserSession.create(FactoryBot.create(:github_user))
        get :new
        expect(response).to have_http_status(:forbidden)
      end
    end

    context "as an admin user" do
      it "assigns a new pic as @pic" do
        UserSession.create(FactoryBot.create(:admin_user))
        get :new
        expect(assigns(:pic)).to be_a_new(Pic)
      end
    end
  end

  describe 'POST #create' do
    context 'as guest user' do
      it 'should be forbidden' do
        post :create, params: { pic: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryBot.create(:github_user))
        post :create, params: { pic: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      before(:each) do
        UserSession.create(FactoryBot.create(:admin_user))
      end

      context 'with valid params' do
        it 'creates a new Pic' do
          expect {
            post :create, params: { pic: valid_attributes }
          }.to change(Pic, :count).by(1)
        end

        it 'assigns a newly created pic as @pic' do
          post :create, params: { pic: valid_attributes }
          expect(assigns(:pic)).to be_a(Pic)
          expect(assigns(:pic)).to be_persisted
        end

        it 'redirects to the created pic' do
          post :create, params: { pic: valid_attributes }
          expect(response).to render_template('show')
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved pic as @pic' do
          post :create, params: { pic: invalid_attributes }
          expect(assigns(:pic)).to be_a_new(Pic)
        end

        it 're-renders the new template' do
          post :create, params: { pic: invalid_attributes }
          expect(response).to render_template('new')
        end
      end
    end
  end

  describe 'PUT #update' do
    context 'as guest user' do
      it 'should be forbidden' do
        patch :update, params: { id: valid_pic.id, pic: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryBot.create(:github_user))
        patch :update, params: { id: valid_pic.id, pic: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      before(:each) do
        UserSession.create(FactoryBot.create(:admin_user))
      end

      context 'with valid params' do
        let(:new_attributes) {
          { upload: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/another_cat.jpg", "image/jpeg") }
        }

        it 'updates the requested pic' do
          put :update, params: { id: valid_pic.to_param, pic: new_attributes }
          valid_pic.reload
          expect(valid_pic.upload_file_name).to eq('another_cat.jpg')
        end

        it 'assigns the requested pic as @pic' do
          put :update, params: { id: valid_pic.to_param, pic: new_attributes }
          expect(assigns(:pic)).to eq(valid_pic)
        end

        it 're-renders the show template' do
          put :update, params: { id: valid_pic.to_param, pic: new_attributes }
          expect(response).to render_template('show')
        end
      end

      context 'with invalid params' do
        it 'assigns the pic as @pic' do
          put :update, params: {id: valid_pic.to_param, pic: invalid_attributes}
          expect(assigns(:pic)).to eq(valid_pic)
        end

        it 're-renders the edit template' do
          put :update, params: {id: valid_pic.to_param, pic: invalid_attributes}
          expect(response).to render_template('edit')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'as guest user' do
      it 'should be forbidden' do
        delete :destroy, params: { id: valid_pic.id, pic: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryBot.create(:github_user))
        delete :destroy, params: { id: valid_pic.id, pic: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      before(:each) do
        UserSession.create(FactoryBot.create(:admin_user))
      end

      it 'destroys the requested pic' do
        p = valid_pic
        expect {
          delete :destroy, params: { id: p.to_param }
        }.to change{ Pic.count }.by(-1)
      end

      it 'redirects to the posts list' do
        delete :destroy, params: { id: valid_pic.to_param }
        expect(response).to redirect_to(pics_url)
      end
    end
  end
end
