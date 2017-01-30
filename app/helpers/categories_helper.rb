module CategoriesHelper
  def categories_list
    content_tag(:ul, class: 'category_list slide') do
      Post.tag_counts_on(:categories).map{|c| c.name}.sort.collect { |category|
        concat(content_tag(:li, link_to(category.titleize, category_path(category))))
      }
    end.html_safe
  end
end
