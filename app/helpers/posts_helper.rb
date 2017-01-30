module PostsHelper
  def post_header_categories_links(post)
    links = ""
    categories = post.categories.map{|c| c.name}.sort
    categories.each do |category|
      comma = category != categories.last ? ', ' : ''
      links += link_to(category.titleize + comma, category_path(category))
    end
    links.html_safe
  end
end
