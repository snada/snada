class CategoriesController < ApplicationController
  def show
    @page_title = params[:id].capitalize + " category"
    @page_description = "Stefano Nada's #{params[:id]} posts"
    @page_keyords = "#{params[:id]}, category, posts"

    render_not_found if Post.tagged_with(params[:id]).empty?
    @posts = Post.tagged_with(params[:id])
  end
end
