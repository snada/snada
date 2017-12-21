require 'rails_helper'

RSpec.describe PageHelper do
  describe 'page_title' do
    it 'should generate a default title when no post or title are defined' do
      expect(page_title).to eq(PageHelper::DEFAULT_TITLE)
    end

    it 'should generate a title with page and default title when defined' do
      @page_title = 'Contact'
      expect(page_title).to eq(@page_title + " | " + PageHelper::DEFAULT_TITLE)
    end

    it 'should generate a title with post title when post is defined' do
      @post = FactoryBot.create(:post)
      expect(page_title).to eq(@post.title + " | " + PageHelper::DEFAULT_TITLE)
    end

    it 'should give room to post over page if both defined' do
      @page_title = 'Contact'
      @post = FactoryBot.create(:post)
      expect(page_title).to eq(@post.title + " | " + PageHelper::DEFAULT_TITLE)
    end
  end

  describe 'page_keywords' do
    it 'should generate default keywords with fixed ones when no post or title are defined' do
      expect(page_keywords).to eq(PageHelper::FIXED_KEYWORDS + ", " + PageHelper::DEFAULT_KEYWORDS)
    end

    it 'should generate keywords with fixed ones and the page defined ones' do
      @page_keywords = "some, example, keys"
      expect(page_keywords).to eq(PageHelper::FIXED_KEYWORDS + ", " + @page_keywords)
    end

    it 'should generate keywords with fixed ones and the post ones when post is defined' do
      @post = FactoryBot.create(:post)
      expect(page_keywords).to eq(PageHelper::FIXED_KEYWORDS + ", " + @post.keywords)
    end

    it 'should give room to post over page if both defined' do
      @page_keywords = "some, example, keys"
      @post = FactoryBot.create(:post)
      expect(page_keywords).to eq(PageHelper::FIXED_KEYWORDS + ", " + @post.keywords)
    end
  end

  describe 'page_description' do
    it 'should generate default description when no post or title are defined' do
      expect(page_description).to eq(PageHelper::DEFAULT_DESCRIPTION)
    end

    it 'should generate description with the page one when defined' do
      @page_description = "This is a custom page description"
      expect(page_description).to eq(@page_description)
    end

    it 'should generate description with the post one when post is defined' do
      @post = FactoryBot.create(:post)
      expect(page_description).to eq(@post.description)
    end

    it 'should give room to post over page if both defined' do
      @post = FactoryBot.create(:post)
      @page_description = "This is a custom page description"
      expect(page_description).to eq(@post.description)
    end
  end
end
