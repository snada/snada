require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_post) {
    FactoryGirl.create(:post)
  }

  let(:valid_attributes) {
    { title: 'title', description: 'description', body: 'body' }
  }

  let(:invalid_attributes) {
    { title: '', description: '', body: '' }
  }

  describe "GET #index" do
    it "assigns all posts as @posts" do
      get :index, {}
      expect(assigns(:posts)).to eq([valid_post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      get :show, {:id => valid_post.to_param}
      expect(assigns(:post)).to eq(valid_post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      get :edit, {:id => valid_post.to_param}
      expect(assigns(:post)).to eq(valid_post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {post: invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, {:post => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'new title', description: 'new description', body: 'new body' }
      }

      it "updates the requested post" do
        put :update, {:id => valid_post.to_param, :post => new_attributes}
        valid_post.reload
        expect(valid_post.title).to eq(new_attributes[:title])
        expect(valid_post.description).to eq(new_attributes[:description])
        expect(valid_post.body).to eq(new_attributes[:body])
      end

      it "assigns the requested post as @post" do
        put :update, {:id => valid_post.to_param, :post => valid_attributes}
        expect(assigns(:post)).to eq(valid_post)
      end

      it "redirects to the post" do
        put :update, {:id => valid_post.to_param, :post => valid_attributes}
        expect(response).to redirect_to(valid_post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        invalid_post = Post.create! valid_attributes
        put :update, {:id => invalid_post.to_param, :post => invalid_attributes}
        expect(assigns(:post)).to eq(invalid_post)
      end

      it "re-renders the 'edit' template" do
        invalid_post = Post.create! valid_attributes
        put :update, {:id => invalid_post.to_param, :post => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end
