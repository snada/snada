require 'rails_helper'
require 'snada_renderer'

RSpec.describe SnadaRenderer do
  let(:renderer) {
    SnadaRenderer.new
  }

  context 'block_code' do
    it 'should render a pygmentized version of a code block' do
      expect(
        renderer.block_code('code', 'ruby')
      ).to eq(
        Pygments.highlight('code', lexer: 'ruby')
      )
    end
  end

  context 'image' do
    it 'should render a responsive image' do
      expect(
        renderer.image('link', 'title', 'content')
      ).to eq(
        "<div class=\"text-center\"><img class=\"img-responsive\" src=\"link\" alt=\"content\"></div>"
      )
    end
  end
end
