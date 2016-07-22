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
    it 'should render a responsive centered image' do
      expect(
        renderer.image('link', 'title', 'content')
      ).to eq(
        "<img class=\"img-responsive center-block\" src=\"link\" alt=\"content\">"
      )
    end
  end
end
