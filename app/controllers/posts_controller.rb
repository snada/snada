class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    authorize! :show, @post
  end

  def new
    @post = Post.new
    authorize! :edit, @post
  end

  def edit
    authorize! :edit, @post
  end

  def create
    @post = Post.create(post_params)
    authorize! :create, @post

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize! :update, @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @post
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :keywords, :category_list, :description, :body)
    end
end
