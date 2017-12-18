require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  setup :activate_authlogic

  after(:each) do
    UserSession.find.destroy if UserSession.find
  end

  let(:valid_post) {
    FactoryGirl.create(:post)
  }

  let(:valid_attributes) {
    { title: 'title', description: 'description', body: 'body', category_list: 'category1, category2' }
  }

  let(:invalid_attributes) {
    { title: '', description: '', body: '' }
  }

  describe 'GET #index' do
    context 'as guest user' do
      it 'assigns all posts as @posts' do
        get :index, params: {}
        expect(assigns(:posts)).to eq(Post.all)
      end
    end

    context 'as normal user ' do
      it 'assigns all posts as @posts' do
        get :index, params: {}
        expect(assigns(:posts)).to eq(Post.all)
      end
    end

    context 'as admin user' do
      it 'assigns all posts as @posts' do
        get :index, params: {}
        expect(assigns(:posts)).to eq(Post.all)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post as @post' do
      get :show, params: {id: valid_post.to_param}
      expect(assigns(:post)).to eq(valid_post)
    end
  end

  describe 'GET #new' do
    context 'as guest user' do
      it 'should be forbidden' do
        get :new
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryGirl.create(:github_user))
        get :new
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      it 'assigns a new post as @post' do
        UserSession.create(FactoryGirl.create(:admin_user))
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe 'GET #edit' do
    context 'as guest user' do
      it 'should be forbidden' do
        get :edit, params: {id: valid_post.to_param}
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryGirl.create(:github_user))
        get :edit, params: {id: valid_post.to_param}
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      it 'assigns the requested post as @post' do
        UserSession.create(FactoryGirl.create(:admin_user))
        get :edit, params: {id: valid_post.to_param}
        expect(assigns(:post)).to eq(valid_post)
      end
    end
  end

  describe 'POST #create' do
    context 'as guest user' do
      it 'should be forbidden' do
        post :create, params: { post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryGirl.create(:github_user))
        post :create, params: { post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      before(:each) do
        UserSession.create(FactoryGirl.create(:admin_user))
      end

      context 'with valid params' do
        it 'creates a new Post' do
          expect {
            post :create, params: {post: valid_attributes}
          }.to change(Post, :count).by(1)
        end

        it 'assigns a newly created post as @post' do
          post :create, params: {post: valid_attributes}
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end

        it 'redirects to the created post' do
          post :create, params: {post: valid_attributes}
          expect(response).to redirect_to(Post.first) #first, not last: default scope ordering
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved post as @post' do
          post :create, params: {post: invalid_attributes}
          expect(assigns(:post)).to be_a_new(Post)
        end

        it 're-renders the new template' do
          post :create, params: {post: invalid_attributes}
          expect(response).to render_template('new')
        end
      end
    end
  end

  describe 'PUT #update' do
    context 'as guest user' do
      it 'should be forbidden' do
        patch :update, params: { id: valid_post.id, post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryGirl.create(:github_user))
        patch :update, params: { id: valid_post.id, post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      before(:each) do
        UserSession.create(FactoryGirl.create(:admin_user))
      end

      context 'with valid params' do
        let(:new_attributes) {
          { title: 'new title', description: 'new description', body: 'new body' }
        }

        it 'updates the requested post' do
          put :update, params: {id: valid_post.to_param, post: new_attributes}
          valid_post.reload
          expect(valid_post.title).to eq(new_attributes[:title])
          expect(valid_post.description).to eq(new_attributes[:description])
          expect(valid_post.body).to eq(new_attributes[:body])
        end

        it 'assigns the requested post as @post' do
          put :update, params: {id: valid_post.to_param, post: new_attributes}
          expect(assigns(:post)).to eq(valid_post)
        end

        it 'redirects to the post' do
          put :update, params: {id: valid_post.to_param, post: new_attributes}
          expect(response).to redirect_to(valid_post)
        end
      end

      context 'with invalid params' do
        it 'assigns the post as @post' do
          invalid_post = Post.create! valid_attributes
          put :update, params: {id: invalid_post.to_param, post: invalid_attributes}
          expect(assigns(:post)).to eq(invalid_post)
        end

        it 're-renders the edit template' do
          invalid_post = Post.create! valid_attributes
          put :update, params: {id: invalid_post.to_param, post: invalid_attributes}
          expect(response).to render_template('edit')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'as guest user' do
      it 'should be forbidden' do
        delete :destroy, params: { id: valid_post.id, post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as normal user' do
      it 'should be forbidden' do
        UserSession.create(FactoryGirl.create(:github_user))
        delete :destroy, params: { id: valid_post.id, post: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'as admin user' do
      before(:each) do
        UserSession.create(FactoryGirl.create(:admin_user))
      end

      it 'destroys the requested post' do
        p = FactoryGirl.create(:post)
        expect {
          delete :destroy, params: { id: p.to_param }
        }.to change{ Post.count }.by(-1)
      end

      it 'redirects to the posts list' do
        p = FactoryGirl.create(:post)
        delete :destroy, params: { id: p.to_param }
        expect(response).to redirect_to(posts_url)
      end
    end
  end
end
