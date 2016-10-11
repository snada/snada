require 'rails_helper'

RSpec.describe CategoriesHelper do
  describe 'categories_list' do
    it 'should generate a list of categories' do
      expected = content_tag(:ul, class: 'category_list slide') do
        Post.tag_counts_on(:categories).map{|_| _.name}.sort.collect { |category|
          concat(content_tag(:li, link_to(category.titleize, category_path(category))))
        }
      end.html_safe

      expect(categories_list).to eq(expected)
    end
  end
end
