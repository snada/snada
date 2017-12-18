require 'rails_helper'

RSpec.describe PostsHelper do
  describe 'post_header_categories_links' do

    it "should return an ordered list of links to categories with commas" do
      post = FactoryBot.create(:post, category_list: 'tdd, rspec, ruby')

      expect(
        post_header_categories_links(post)
      ).to eq(
        link_to('Rspec, ', category_path('rspec')) +
        link_to('Ruby, ', category_path('ruby')) +
        link_to('Tdd' , category_path('tdd'))
      )
    end
  end
end
