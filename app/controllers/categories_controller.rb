class CategoriesController < ApplicationController
  def show
    render_not_found if Post.tagged_with(params[:id]).empty?
    @posts = Post.tagged_with(params[:id])
  end
end
